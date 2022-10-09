package repository.impl;

import model.Facility;
import repository.BaseRepository;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private final String SELECT_FACILITY = "select * from facility; ";
    private final String INSERT_INTO = "insert into facility(name,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free)\n" +
            "values(?,?,?,?,?,?,?,?,?,?,?);";
    private final String FIND_BY_ID = "select * from facility where id=?";
    private final String UPDATE_FACILITY = "update facility set name = ? , area = ? , cost = ? , max_people=?, rent_type_id=?,facility_type_id =?, standard_room=?, description_other_convenience=?, pool_area=?,number_of_floors =?, facility_free=? where id = ?";
    private final String DELETE_BY_ID = "delete from facility where id = ? ;";
    @Override
    public List<Facility> findAll() {
        List<Facility> list = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_FACILITY);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int area = resultSet.getInt("area");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeID = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("rent_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                Facility facility = new Facility(id,name,area,cost,maxPeople,rentTypeID,facilityTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree);
                list.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean add(Facility facility) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_INTO);
            ps.setString(1,facility.getName());
            ps.setInt(2,facility.getArea());
            ps.setDouble(3,facility.getCost());
            ps.setInt(4,facility.getMaxPeople());
            ps.setInt(5,facility.getRentTypeId());
            ps.setInt(6,facility.getFacilityTypeId());
            ps.setString(7,facility.getStandardRoom());
            ps.setString(8,facility.getDescriptionOtherConvenience());
            ps.setDouble(9,facility.getPoolArea());
            ps.setInt(10,facility.getNumberOfFloors());
            ps.setString(11,facility.getFacilityFree());
            int num = ps.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Facility findByID(int id) {
        Facility facility = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_BY_ID);
            ps.setInt(1,id);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                String name = resultSet.getString("name");
                int area = resultSet.getInt("id");
                double cost = resultSet.getDouble("cost");
                int maxPeople = resultSet.getInt("max_people");
                int rentTypeID = resultSet.getInt("rent_type_id");
                int facilityTypeId = resultSet.getInt("rent_type_id");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = resultSet.getDouble("pool_area");
                int numberOfFloors = resultSet.getInt("number_of_floors");
                String facilityFree = resultSet.getString("facility_free");
                facility = new Facility(name,area,cost,maxPeople,rentTypeID,facilityTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public boolean update(Facility facility) {
        boolean rowUpdat = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_FACILITY);
            ps.setString(1,facility.getName());
            ps.setInt(2,facility.getArea());
            ps.setDouble(3,facility.getCost());
            ps.setInt(4,facility.getMaxPeople());
            ps.setInt(5,facility.getRentTypeId());
            ps.setInt(6,facility.getFacilityTypeId());
            ps.setString(7,facility.getStandardRoom());
            ps.setString(8,facility.getDescriptionOtherConvenience());
            ps.setDouble(9,facility.getPoolArea());
            ps.setInt(10,facility.getNumberOfFloors());
            ps.setString(11,facility.getFacilityFree());
            ps.setInt(12,facility.getId());
            rowUpdat = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdat;
    }

    @Override
    public boolean delete(int id) {
        Boolean rowDelete = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_BY_ID);
            ps.setInt(1,id);
            rowDelete = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }
}
