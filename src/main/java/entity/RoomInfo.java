package entity;

/**
 * Created by isus on 2019/2/16.
 */
public class RoomInfo {
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getCapacity() {
        return capacity;
    }



    public String getConfiguration() {
        return configuration;
    }

    public void setConfiguration(String configuration) {
        this.configuration = configuration;
    }

    private String id;
    private String number;
    private String address;

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    private Integer capacity;
    private String configuration;
}
