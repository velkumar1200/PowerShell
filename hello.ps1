import java.util.*;
import java.io.*;
public class Test {
    public static void main(String ... args) {
        try {
            ProcessBuilder launcher = new ProcessBuilder();
            Map<String, String> environment = launcher.environment();
            launcher.redirectErrorStream(true);
            launcher.directory(new File("\\\\remote_machine\\Snaps\\"));
            launcher.command("powershell.exe", ".\\Script.ps1");
            Process p = launcher.start(); // And launch a new process
            BufferedReader stdInput = new BufferedReader(new
            InputStreamReader(p.getInputStream()));
            String line;
            System.out.println("Output :");
            while ((line = stdInput.readLine()) != null) {
                System.out.println(line);
            }
        } catch (Exception e){
           e.printStackTrace();
        }
    }
}