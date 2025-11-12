package StateApp;

import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.faces.event.ValueChangeEvent;
import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

@Named("stateBean")
@SessionScoped
public class StateBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private String selectedState;
    private String language;

    private static final Map<String, String> stateLanguageMap = new LinkedHashMap<>();

    static {
        stateLanguageMap.put("Karnataka", "Kannada");
        stateLanguageMap.put("Maharashtra", "Marathi");
        stateLanguageMap.put("Tamil Nadu", "Tamil");
        stateLanguageMap.put("Kerala", "Malayalam");
        stateLanguageMap.put("Andhra Pradesh", "Telugu");
        stateLanguageMap.put("West Bengal", "Bengali");
        stateLanguageMap.put("Gujarat", "Gujarati");
        stateLanguageMap.put("Rajasthan", "Hindi");
        stateLanguageMap.put("Punjab", "Punjabi");
        stateLanguageMap.put("Odisha", "Odia");
    }

    public void stateChanged(ValueChangeEvent event) {
        String newState = (String) event.getNewValue();
        this.language = stateLanguageMap.get(newState);
    }

    public String getSelectedState() {
        return selectedState;
    }

    public void setSelectedState(String selectedState) {
        this.selectedState = selectedState;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Map<String, String> getStateLanguageMap() {
        return stateLanguageMap;
    }
}
