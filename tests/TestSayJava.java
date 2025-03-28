import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import src.SaySalomon;

public class TestSayJava {

    @Test
    public void testTextToSpeech() {
        SaySalomon say = new SaySalomon("🔑 Your_API_Key");
        String result = say.textToSpeech("test");
        assertNotNull(result);
    }
}
