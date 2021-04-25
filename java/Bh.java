public class Bh {

    public static void main(String[] args) throws Exception {
        java.security.MessageDigest md = 
        java.security.MessageDigest.getInstance("MD5");

        int count = 0;
        int i = 0;
        //StringBuffer sb = new StringBuffer();
        StringBuilder sb = new StringBuilder();
        while (true) {
            // clear the StringBuilder/StringBuffer
            sb.setLength(0);

            //
            sb.append("abc");
            sb.append(i);

            // this is a string allocation
            byte[] sb_bytes = sb.toString().getBytes();
            md.update(sb_bytes);

            // this is a byte array allocation
            byte[] buffer = md.digest();

            // weirdness on the & 0xff is to get rid of the sign
            // byte in java is -127 to 127
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