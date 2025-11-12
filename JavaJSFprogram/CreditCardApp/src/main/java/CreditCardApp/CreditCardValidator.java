package CreditCardApp;

import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.FacesContext;
import jakarta.faces.validator.FacesValidator;
import jakarta.faces.validator.Validator;
import jakarta.faces.validator.ValidatorException;

@FacesValidator("creditCardValidator")
public class CreditCardValidator implements Validator<Object> {

    @Override
    public void validate(FacesContext context, UIComponent component, Object value)
            throws ValidatorException {

        if (value == null) {
            return;
        }

        String creditCard = value.toString().trim()
                .replaceAll("\\s+", "")
                .replaceAll("-", "");

        // Only digits
        if (!creditCard.matches("\\d+")) {
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Credit card must contain only digits.", null));
        }

        // Length check
        if (creditCard.length() < 13 || creditCard.length() > 19) {
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR, 
            		"Credit card number must be between 13 and 19 digits.", null));
        }

        // Luhn Algorithm
        if (!isValidLuhn(creditCard)) {
            throw new ValidatorException(new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Invalid credit card number (fails Luhn check).", null));
        }
    }

    private boolean isValidLuhn(String cardNumber) {
        int sum = 0;
        boolean alternate = false;

        for (int i = cardNumber.length() - 1; i >= 0; i--) {
            int digit = Character.getNumericValue(cardNumber.charAt(i));

            if (alternate) {
                digit *= 2;
                if (digit > 9) digit = (digit % 10) + 1;
            }

            sum += digit;
            alternate = !alternate;
        }

        return (sum % 10 == 0);
    }
}
