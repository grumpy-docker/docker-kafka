import org.apache.commons.io.IOUtils;

import java.io.InputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by asherwin on 12/7/15.
 */
public class DottedPropsEnvReplacementBashScript {

  public static void main(String[] args) throws Exception {


    List<String> lines = null;

    try (InputStream in = DottedPropsEnvReplacementBashScript.class.getResourceAsStream("/source.txt")) {
      lines = IOUtils.readLines(in);
    }


    final Pattern originalPattern = Pattern.compile("(#.*)=.*");

    final StringBuilder sb = new StringBuilder();

    for (final String line : lines) {
      Matcher matcher = originalPattern.matcher(line);
      if (!matcher.matches()) {
        throw new RuntimeException("[" + line + "] failed original pattern");
      }

      if (sb.length() > 0) {
        sb.append("\n");
      }

      String matchString = matcher.group(1);
      String dottedProp = matchString.replaceAll("#", "");

      String envVariable = convertToEnvVariable(dottedProp);

      sb.append(String.format("if [ ! -z \"${%s}\" ]; then", envVariable)).append("\n");
      sb.append(String.format("  echo \"%s: ${%s}\"", envVariable, envVariable)).append("\n");
      sb.append(String.format("  sed -r -i \"s|#(%s)=.*|\\1=${%s}|g\" /kafka/config/server.properties", dottedProp, envVariable)).append("\n");
      sb.append(String.format("fi")).append("\n");


    }

    System.out.println(sb.toString());
  }

  private static String convertToEnvVariable(String dottedProp) {
    return String.format("KAFKA_%s", dottedProp.replaceAll("\\.", "_").toUpperCase());
  }
}
