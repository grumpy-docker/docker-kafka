package acadia.locks;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.InputStream;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by asherwin on 12/7/15.
 */
public class DottedPropsMarkdownTableScript {

  public static void main(String[] args) throws Exception {


    List<String> lines = null;

    try (InputStream in = DottedPropsMarkdownTableScript.class.getResourceAsStream("/source.txt")) {
      lines = IOUtils.readLines(in);
    }


    final Pattern originalPattern = Pattern.compile("(#.*)=(.*)");

    final StringBuilder sb = new StringBuilder();

    sb.append("|ENV VAR|Kafka server property|Default|").append("\n");
    sb.append("|-------|---------------------|-------|").append("\n");

    for (final String line : lines) {
      Matcher matcher = originalPattern.matcher(line);
      if (!matcher.matches()) {
        throw new RuntimeException("[" + line + "] failed original pattern");
      }

      String matchString = matcher.group(1);
      String value = StringUtils.defaultString(matcher.group(2), "");
      String dottedProp = matchString.replaceAll("#", "");

      String envVariable = convertToEnvVariable(dottedProp);

      sb.append(String.format("|%s|%s|%s|", envVariable, dottedProp, value)).append("\n");


    }

    System.out.println(sb.toString());
  }

  private static String convertToEnvVariable(String dottedProp) {
    return String.format("KAFKA_%s", dottedProp.replaceAll("\\.", "_").toUpperCase());
  }
}
