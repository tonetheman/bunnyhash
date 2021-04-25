public class Bh {

    public static void main(String[] args) throws Exception {
        java.security.MessageDigest md = 
        java.security.MessageDigest.getInstance("MD5");

        int count = 0;
        int i = 0;
        //StringBuffer sb = new StringBuffer();
        StringBuilder sb = new StringBuilder();
        while (true) {
            sb.setLength(0);
            sb.append("abc");
            sb.append(i);
            byte[] sb_bytes = sb.toString().getBytes();
            md.update(sb_bytes);
            byte[] buffer = md.digest();
            if ((buffer[0]==0x00) && (buffer[1]==0x00) && 
                (buffer[2]&0xff)<16) {
                System.out.print(String.format("%01x",buffer[2]));
                count++;
                if (count>7) {
                    break;
                }
            }
            i++;
        }
        System.out.println();
        
    }
}