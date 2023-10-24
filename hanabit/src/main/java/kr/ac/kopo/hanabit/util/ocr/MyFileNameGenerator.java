package kr.ac.kopo.hanabit.util.ocr;

import java.io.File;
import java.util.UUID;

public class MyFileNameGenerator {

    public static File rename(File f) {
        String name = f.getName();
        String ext = "";
        int dot = name.lastIndexOf(".");
        if (dot != -1) {
            ext = name.substring(dot);
        } else {
            ext = "";
        }
        String str = "kopo" + UUID.randomUUID();
        File renameFile = new File(f.getParent(), str + ext);
        return renameFile;
    }
}
