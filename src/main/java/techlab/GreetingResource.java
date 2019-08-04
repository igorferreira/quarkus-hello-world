package techlab;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/hello")
public class GreetingResource {

    protected final Logger log = LoggerFactory.getLogger(this.getClass());

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {

        log.info("\n\n logging... Hello World ! alterado 3\n\n");

        return "hello";
    }
}