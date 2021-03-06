package com.yottabyte.webDriver;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.utils.GetLogger;
import com.yottabyte.utils.TakeScreenShot;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import net.lightbody.bmp.BrowserMobProxyServer;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.chrome.ChromeDriverService;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.logging.LogEntry;
import org.openqa.selenium.logging.LogType;
import org.openqa.selenium.logging.LoggingPreferences;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.UnreachableBrowserException;
import org.openqa.selenium.support.events.EventFiringWebDriver;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;


public class SharedDriver extends EventFiringWebDriver {
    public static String WebDriverType;
    private static WebDriver REAL_DRIVER = null;
    private static Scenario scenario;
    private static TakeScreenShot screenShot = new TakeScreenShot();
    private static ChromeDriverService service;
    private static BrowserMobProxyServer browserMobProxy;
    private static final Thread CLOSE_THREAD = new Thread() {
        @Override
        public void run() {
            System.out.println("chsfinduml==============================================[last10]");
            REAL_DRIVER.close();
            if (service != null && service.isRunning()) {
                service.stop();
            }
            if (browserMobProxy != null && browserMobProxy.isStarted()) {
                browserMobProxy.stop();
            }
        }
    };

    static {
        System.out.println("chsfinduml==============================================[11]static");
        Runtime.getRuntime().addShutdownHook(CLOSE_THREAD);
        ConfigManager config = new ConfigManager();
        DesiredCapabilities browser = null;
        try {
            System.out.println("===================??????????????????????????????webdirver");
            if ("chrome".equalsIgnoreCase(config.get("browser"))) {
                System.out.println("????????????????????????" + config.get("browser"));
                //?????????chrome???????????????
                browser = ChromeDes();
            } else {
                judgingBrowserType(config, browser);
            }
            EventListener eventListener = new EventListener();

            BrowserMobProxyService.startBrowserMobProxy();
            browserMobProxy = BrowserMobProxyService.getBrowserMobProxyServer();
//            browser.setCapability(CapabilityType.LOGGING_PREFS, getLogPreferences());
            String ServerHOst;
            ServerHOst = config.get("selenium_server_host");
            GetLogger.getLogger().info("ServerHOst: {}", ServerHOst);
            URL url = new URL("http://" + ServerHOst + ":4444/wd/hub");
            System.out.println("chsfinduml=====================[oyk] Remore selenium serverURL" + url);
            REAL_DRIVER = new RemoteWebDriver(url, browser);
            System.out.println("?????????remoteWebDriver ??????");
            REAL_DRIVER = new EventFiringWebDriver(REAL_DRIVER).register(eventListener);
//            REAL_DRIVER.manage().window().fullscreen();
            WebDriverType = "Remote";
        } catch (MalformedURLException exceptions) {

        } catch (UnreachableBrowserException e) {
            System.out.println("??????????????????selenium server ??????. Start ????????? local service");
            if ("chrome".equalsIgnoreCase(config.get("browser"))) {
                //???????????????chrome???????????????
                browser = LocalChromeDes();
            } else {
                judgingBrowserType(config, browser);
            }
            EventListener eventListener = new EventListener();

            BrowserMobProxyService.startBrowserMobProxy();
            browserMobProxy = BrowserMobProxyService.getBrowserMobProxyServer();
            browser.setCapability(CapabilityType.LOGGING_PREFS, getLogPreferences());
            LocalChromeDriverService.createAndStartService();
            service = LocalChromeDriverService.getService();
            REAL_DRIVER = new RemoteWebDriver(service.getUrl(), browser);
            REAL_DRIVER = new EventFiringWebDriver(REAL_DRIVER).register(eventListener);
//            REAL_DRIVER.manage().window().fullscreen();
            WebDriverType = "Local";
        }
    }

    public SharedDriver() {
        super(REAL_DRIVER);
//        REAL_DRIVER.manage().window().maximize();
//        REAL_DRIVER.manage().window().fullscreen();
        REAL_DRIVER.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        REAL_DRIVER.manage().timeouts().pageLoadTimeout(5, TimeUnit.MINUTES);
        System.out.println("chsfinduml==============================================[12_2]SharedDriver()");
    }

    @Override
    public void close() {
        if (Thread.currentThread() != CLOSE_THREAD) {
            throw new UnsupportedOperationException("You shouldn't close this WebDriver. It's shared and will close when the JVM exits.");
        }
        super.close();
        super.quit();
    }

    @Before
    public void deleteAllCookies(Scenario scenario) throws InterruptedException {
        this.scenario = scenario;
        System.out.println("===========????????????   Feature: " + scenario.getName() + " Tags: " + scenario.getSourceTagNames().toString() + " ==========");
//        manage().deleteAllCookies();
    }

    @After
    public void embedScreenshot(Scenario scenario) {
        try {
            System.out.println("chsfinduml==============================================[13]");
            LogEntries logEntries = REAL_DRIVER.manage().logs().get(LogType.BROWSER);
            System.out.println("=============================????????????????????????================================");
            GetLogger.getTraceIdFromRequest(REAL_DRIVER);
            for (LogEntry entry : logEntries) {
                if (!(entry.getLevel().toString().contains("INFO") || entry.getLevel().toString().contains("WARNING"))) {
                    System.out.println(entry);
                }
            }
            System.out.println("=============================????????????================================");
            System.out.println("??????????????????????????????url???" + REAL_DRIVER.getCurrentUrl());

            byte[] screenshot = getScreenshotAs(OutputType.BYTES);
            scenario.embed(screenshot, "image/png");

        } catch (WebDriverException somePlatformsDontSupportScreenshots) {
            System.err.println(somePlatformsDontSupportScreenshots.getMessage());
        }
    }

    /**
     * ????????????chrome???????????????
     *
     * @return
     */
    private static DesiredCapabilities ChromeDes() {
        System.out.println("chsfinduml==============================================[12_11]static DesiredCapabilities ChromeDes()");
        String sp = File.separator;
        ConfigManager config = new ConfigManager();
        try {
            String downloadFilepath = config.get("ftp_base_path") + "\\" + "target" + "\\" + "download-files";
            ChromeOptions options = new ChromeOptions();
            System.out.println("???????????????" + System.getProperty("os.name"));
            options.setBinary(config.get("chrome_location"));
//            options.setBinary("C:\\Users\\rizhiyi\\AppData\\Local\\Google\\Chrome\\Application\\chrome.exe");
            HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
            // ?????????????????????????????????
            chromePrefs.put("profile.default_content_settings.popups", 0);
            // ???????????????????????????
            chromePrefs.put("download.default_directory", downloadFilepath);
            System.out.println("??????????????????-----" + downloadFilepath);
            options.setExperimentalOption("prefs", chromePrefs);
            options.setExperimentalOption("excludeSwitches", new String[]{"enable-automation"});  //??????"Chrome?????????????????????????????????"
            options.addArguments("test-type", "start-maximized");
//            options.setCapability("goog:loggingPrefs", getLogPreferences());
//            options.addArguments("--trace-to-console", "--auto-open-devtools-for-tabs");  // ?????????????????????????????????????????????
//            options.addArguments("--headless", "--disable-gpu"); //??????chromeheadless??????
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.chrome();
            desiredCapabilities.setBrowserName("chrome");
            desiredCapabilities.setJavascriptEnabled(true);
            desiredCapabilities.setCapability(CapabilityType.LOGGING_PREFS, getLogPreferences());
            desiredCapabilities.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
            desiredCapabilities.setCapability(ChromeOptions.CAPABILITY, options);
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    private static DesiredCapabilities LocalChromeDes() {
        System.out.println("chsfinduml==============================================[12_11]static DesiredCapabilities LocalChromeDes()");
        String sp = File.separator;
        String downloadFilepath = System.getProperty("user.dir") + sp + "target" + sp + "download-files";
        try {
            ChromeOptions options = new ChromeOptions();
            if ("Mac OS X".equalsIgnoreCase(System.getProperty("os.name"))) {
                ConfigManager config = new ConfigManager();
                System.out.println("????????????mac " + System.getProperty("os.name"));
                options.setBinary(config.get("macbinary"));
            }
            HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
            // ?????????????????????????????????
            chromePrefs.put("profile.default_content_settings.popups", 0);
            // ???????????????????????????
            chromePrefs.put("download.default_directory", downloadFilepath);

            options.setExperimentalOption("prefs", chromePrefs);
            options.setExperimentalOption("excludeSwitches", new String[]{"enable-automation"});  //??????"Chrome?????????????????????????????????"
            options.addArguments("test-type", "start-maximized");
//            options.addArguments("--headless");
//            options.addArguments("--disable-gpu");
//            options.addArguments("--trace-to-console", "--auto-open-devtools-for-tabs");  // ?????????????????????????????????????????????
//            options.addArguments("--headless", "--disable-gpu"); //??????chromeheadless??????
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.chrome();
            desiredCapabilities.setBrowserName("chrome");
            desiredCapabilities.setJavascriptEnabled(true);
            desiredCapabilities.setCapability(CapabilityType.LOGGING_PREFS, getLogPreferences());
            desiredCapabilities.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
            desiredCapabilities.setCapability(ChromeOptions.CAPABILITY, options);
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * ????????????IE???????????????
     *
     * @return
     */
    private static DesiredCapabilities IEDes() {
        try {
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.internetExplorer();
            desiredCapabilities.setBrowserName("internet Explorer");
            desiredCapabilities.setVersion("11");
            desiredCapabilities.setPlatform(Platform.WINDOWS);
            desiredCapabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
            desiredCapabilities.setCapability("ignoreProtectedModeSettings", true);
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * ????????????firefox???????????????
     *
     * @return
     */
    private static DesiredCapabilities FirefoxDes() {
        try {
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.firefox();
            desiredCapabilities.setBrowserName("firefox");
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Scenario getScenario() {
        return scenario;
    }

    public static TakeScreenShot getScreenShot() {
        return screenShot;
    }

    private static void judgingBrowserType(ConfigManager config, DesiredCapabilities browser) {
        if ("firefox".equalsIgnoreCase(config.get("browser"))) {
            browser = FirefoxDes();
        } else if ("internet Explorer".equalsIgnoreCase(config.get("browser"))) {
            browser = IEDes();
        } else {
            System.out.println("?????????????????????????????????");
        }
    }

    private static LoggingPreferences getLogPreferences() {
        LoggingPreferences logPrefs = new LoggingPreferences();
        logPrefs.enable(LogType.PERFORMANCE, Level.ALL);
        logPrefs.enable(LogType.BROWSER, Level.ALL);
        System.out.println("??????????????????");
//        logPrefs.enable(LogType.CLIENT, Level.ALL);
        logPrefs.enable(LogType.DRIVER, Level.ALL);
//        logPrefs.enable(LogType.SERVER, Level.ALL);
        return logPrefs;
    }
}