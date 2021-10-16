package com.casasky;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.SQSEvent;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Handler implements RequestHandler<SQSEvent, String> {

    private static final Logger logger = LogManager.getLogger();

    @Override
    public String handleRequest(SQSEvent input, Context context) {
        logger.info("Handling request...");
        return "Success";
    }
}
