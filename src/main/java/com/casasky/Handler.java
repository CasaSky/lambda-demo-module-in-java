package com.casasky;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.SQSEvent;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


import java.util.stream.Collectors;

public class Handler implements RequestHandler<SQSEvent, String> {

    private static final Logger LOGGER = LogManager.getLogger();

    @Override
    public String handleRequest(SQSEvent input, Context context) {
        if (input.getRecords() == null) {
            LOGGER.debug("No records found");

            return "Failure";
        }

        LOGGER.debug("Handling request {}", input.getRecords().stream()
                .map(SQSEvent.SQSMessage::getBody)
                .collect(Collectors.toList()));

        return "Success";
    }
}
