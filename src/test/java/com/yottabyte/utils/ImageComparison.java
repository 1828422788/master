package com.yottabyte.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;

/**
 * 感知哈希算法
 * 1.缩小图片：32 * 32是一个较好的大小，这样方便DCT计算
 *
 * 2.转化为灰度图：把缩放后的图片转化为256阶的灰度图。（具体算法见平均哈希算法步骤）
 *
 * 3.计算DCT:DCT把图片分离成分率的集合
 *
 * 4.缩小DCT：DCT是32*32，保留左上角的8*8，这些代表的图片的最低频率
 *
 * 5.计算平均值：计算缩小DCT后的所有像素点的平均值。
 *
 * 6.进一步减小DCT：大于平均值记录为1，反之记录为0.
 *
 * 7.得到信息指纹：组合64个信息位，顺序随意保持一致性即可。
 *
 * 8.对比指纹：计算两幅图片的指纹，计算汉明距离（从一个指纹到另一个指纹需要变几次），汉明距离越大则说明图片越不一致，
 *
 * 反之，汉明距离越小则说明图片越相似，当距离为0时，说明完全相同。通常认为0<距离<5 两张图片相似，距离>10 就是两张完全不同的图片
 */
public class ImageComparison {
    /**
     * 缩小图片
     *
     * @param image
     * @param width
     * @param height
     * @return
     */
    public static BufferedImage reduceSize(BufferedImage image, int width, int height) {
        BufferedImage new_image;
        double width_times = (double) width / image.getWidth();
        double height_times = (double) height / image.getHeight();
        if (image.getType() == BufferedImage.TYPE_CUSTOM) {
            ColorModel cm = image.getColorModel();
            WritableRaster raster = cm.createCompatibleWritableRaster(width, height);
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();
            new_image = new BufferedImage(cm, raster, alphaPremultiplied, null);
        } else {
            new_image = new BufferedImage(width, height, image.getType());
        }
        Graphics2D g = new_image.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.drawRenderedImage(image, AffineTransform.getScaleInstance(width_times, height_times));
        g.dispose();
        return new_image;
    }

    /**
     * 得到灰度值
     *
     * @param image
     * @return
     */
    public static double[][] getGrayValue(BufferedImage image) {
        int width = image.getWidth();
        int height = image.getHeight();
        double[][] pixels = new double[width][height];
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                pixels[i][j] = computeGrayValue(image.getRGB(i, j));
            }
        }
        return pixels;
    }

    /**
     * 计算灰度值
     *
     * @param pixel
     * @return
     */
    public static double computeGrayValue(int pixel) {
        int red = (pixel >> 16) & 0xFF;
        int green = (pixel >> 8) & 0xFF;
        int blue = (pixel) & 255;
        return 0.3 * red + 0.59 * green + 0.11 * blue;
    }

    public static int avgImage(int[][] smallImage) {
        int avg;
        int sum = 0;
        int count = 0;
        for (int i = 0; i < smallImage.length; i++) {
            for (int j = 0; j < smallImage[i].length; j++) {
                sum += smallImage[i][j];
                count++;
            }
        }
        avg = sum / count;
        return avg;
    }

    public static String to64(int avg, int[][] smallImage) {
        String result = "";
        for (int i = 0; i < smallImage.length; i++) {
            for (int j = 0; j < smallImage[i].length; j++) {
                if (smallImage[i][j] > avg) {
                    result += "1";
                } else {
                    result += "0";
                }
            }
        }
        return result;
    }//越小越相似

    public static String toPhash(BufferedImage image) {
        //缩小图片
        BufferedImage newImage = reduceSize(image, 32, 32);
        //转换为256位灰度
        double[][] pixels = getGrayValue(newImage);
        //计算DCT
        DCT dct = new DCT(25);
        int[][] tempDCT = dct.forwardDCT(pixels);
        //缩小DCT
        int[][] smallImage = dct.dequantitizeImage(tempDCT, false);
        //计算平均值
        int avg = avgImage(smallImage);
        //进一步减小DCT,得到信息指纹
        String result = to64(avg, smallImage);
        return result;
    }

    /**
     * 计算"汉明距离"（Hamming distance）。
     * 如果不相同的数据位不超过5，就说明两张图片很相似；如果大于10，就说明这是两张不同的图片。
     *
     * @param sourceHashCode 源hashCode
     * @param hashCode       与之比较的hashCode
     */
    public static int hammingDistance(String sourceHashCode, String hashCode) {
        int difference = 0;
        int len = sourceHashCode.length();

        for (int i = 0; i < len; i++) {
            if (sourceHashCode.charAt(i) != hashCode.charAt(i)) {
                difference++;
            }
        }

        return difference;
    }

    public static boolean imageComparison(String sourceImage, String targetImage) throws IOException {
        String sourceFingerPrint = ImageComparison.toPhash(ImageIO.read(new File(sourceImage + ".png")));
        String targetFingerPrint = ImageComparison.toPhash(ImageIO.read(new File(targetImage + ".png")));
        int difference = ImageComparison.hammingDistance(sourceFingerPrint, targetFingerPrint);
        if (difference > 5) {
            return false;
        }
        return true;
    }

    public static void main(String[] args) throws IOException {
        String phash1 = toPhash(ImageIO.read(new File("target/cucumber-html-reports/embeddings/actual_img/galaxee/line.png")));
        String phash2 = toPhash(ImageIO.read(new File("target/cucumber-html-reports/embeddings/actual_img/galaxee/line2y.png")));
        System.out.println(phash1);
        System.out.println(phash2);
        System.out.println(hammingDistance(phash1, phash2));
    }
}
