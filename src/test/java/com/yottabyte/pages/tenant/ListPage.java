package com.yottabyte.pages.tenant;

import com.yottabyte.pages.PageTemplate;
import org.assertj.core.internal.cglib.asm.$ClassReader;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='搜索租户']")
    private WebElement searchInput;
    public WebElement getSearchInput() {
        return searchInput;
    }

    @FindBy(xpath = "//button[@class='el-button tenant_new el-button--primary']/span[@text()='新建']")
    private WebElement createButton;
    public WebElement getCreateButton() {
        return super.getButton("新建");
    }


//   jnd
//系统状态的按钮
    @FindBy(xpath = "//a[text()='系统状态']")
    private WebElement systemStatus;
    public WebElement getSystemStatus(){return systemStatus;}
    //支持特性的查看按钮
    @FindBy(xpath = "//div[text()='支持特性:']/following-sibling::div/button/span[text()='查看']")
    private WebElement supportCharacter;
    public WebElement getSupportCharacter(){return supportCharacter;}
    //支持特性收起按钮
    @FindBy(xpath = "//div[text()='支持特性:']/following-sibling::div/button/span[text()='收起']")
    private WebElement characterRetract;
    public WebElement getCharacterRetract(){return characterRetract;}

    //许可证详情查看
    @FindBy(xpath = "//div[text()='许可证详情:']/following-sibling::div/button/span[text()='查看']")
    private WebElement  permitDetails;
    public WebElement getPermitDetails(){return permitDetails;}

    //许可证详情收起
    @FindBy(xpath = "//div[text()='许可证详情:']/following-sibling::div/button/span[text()='收起']")
    private WebElement  permitDetailsRetract;
    public WebElement getPermitDetailsRetract(){return permitDetailsRetract;}

//租户外观按钮
    @FindBy(xpath = "//a[text()='租户外观']")
    private WebElement tenantAppearance;
    public WebElement getTenantAppearance(){return tenantAppearance;}

    @FindBy(xpath = "(//input[@class='el-color-dropdown__value'])[last()]")
    private WebElement colorInput;
    public WebElement getColorInput(){return colorInput;}

    @FindBy(xpath = "(//button[@class='el-color-dropdown__btn'])[last()]")
    private WebElement ensureColor;
    public WebElement getEnsureColor(){return ensureColor;}

    //主色系
    @FindBy(xpath = "//h5[text()='主色系']/parent::div/following-sibling::div")
    private WebElement mainColor;
    public WebElement getMainColor(){return mainColor;}
    //    主色系悬停
    @FindBy(xpath = "//h5[text()='主色系悬停']/parent::div/following-sibling::div")
    private WebElement mainColorHover;
    public WebElement getMainColorHover(){return mainColorHover;}
    //一级导航
    @FindBy(xpath = "//h5[text()='一级导航']/parent::div/following-sibling::div")
    private WebElement firstNavigation;
    public WebElement getFirstNavigation(){return firstNavigation;}
    //图标及占位符辅助色
    @FindBy(xpath = "//h5[text()='图标及占位符辅助色']/parent::div/following-sibling::div")
    private WebElement iconColor;
    public WebElement getIconColor(){return iconColor;}

    //更新按钮
    @FindBy(xpath = "//span[text()='更新']")
    private WebElement update;
    public WebElement getUpdate(){return update;}

    //恢复初始状态
    @FindBy(xpath = "//span[text()='恢复初始值']")
    private WebElement firstStatus;
    public WebElement getFirstStatus(){return firstStatus;}

    //替换logo的按钮
    @FindBy(xpath = "//span[text()='替换']")
    private WebElement replaceLogo;
    public WebElement getReplaceLogo(){return replaceLogo;}

    //重值logo按钮
    @FindBy(xpath = "//span[text()='重置']")
    private WebElement reset;
    public WebElement getReset(){return reset;}

//租户管理列表页，查看租户ops信息
    @FindBy(xpath = "//div[text()='ops (ops)']/parent::td/preceding-sibling::td/div/div/i")
    private WebElement lookButton;
    public WebElement getLookButton(){return lookButton;}

    @FindBy(xpath = "//label[contains(text(),'每日限额:')]/parent::div/div/span")
    private WebElement everydayLimit;
    public WebElement getEverydayLimit(){return everydayLimit;}

    @FindBy(xpath = "//label[contains(text(),'有效期')]/parent::div/div/span")
    private WebElement timeOfValidity;
    public WebElement getTimeOfValidity(){return timeOfValidity;}

    @FindBy(xpath = "//label[contains(text(),'支持特性')]/parent::div/div")
    private WebElement support;
    public WebElement getSupport(){return support;}


//用户信息修改

    //人头
    @FindBy(xpath = "//a[text()='Agent 管理']/parent::span/following-sibling::div/div")
    private WebElement people;
    public WebElement getPeople(){return people;}
    //用户信息
    @FindBy(xpath = "//ul[@class='el-dropdown-menu group_user_menu']/li[text()='用户信息']")
    private WebElement userInformation;
    public WebElement getUserInformation(){return userInformation;}

    //修改信息
    @FindBy(xpath = "//span[text()='修改信息']")
    private WebElement modifyInformation;
    public WebElement getModifyInformation(){return modifyInformation;}

    //管理员名称
    @FindBy(xpath = "//label[contains(text(),'管理员')]/following-sibling::div/div/input")
    private WebElement managerName;
    public WebElement getManagerName(){return managerName;}

    //接受邮箱
    @FindBy(xpath = "//label[contains(text(),'接收邮箱')]/following-sibling::div/div/input")
    private WebElement acceptMailbox;
    public WebElement getAcceptMailbox(){return acceptMailbox;}

    @FindBy(xpath = "//div[@class='el-message-box__btns']/button/span[contains(text(),'确定')]")
    private WebElement ensure;
    public WebElement  getEnsure(){return ensure;}

    //验证管理员的名称
    @FindBy(xpath = "//label[contains(text(),'管理员')]/following-sibling::div/label")
   private WebElement verifyAdminName;
    public WebElement getVerifyAdminName(){return verifyAdminName;}
    //验证管理员的邮箱
    @FindBy(xpath = "//label[contains(text(),'接收邮箱')]/following-sibling::div/label")
    private WebElement verifyMailbox;
    public WebElement getVerifyMailbox(){return verifyMailbox;}

}
