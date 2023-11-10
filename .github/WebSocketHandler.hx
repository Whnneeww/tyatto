import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
@Controller
public class ChatApplication {

    private List<String> messages = new ArrayList<>();

    public static void main(String[] args) {
        SpringApplication.run(ChatApplication.class, args);
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/send")
    @SendTo("/topic/messages")
    public String sendMessage(String message) {
        messages.add(message);
        return message;
    }

}
