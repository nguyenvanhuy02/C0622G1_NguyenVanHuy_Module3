package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();
    boolean add(Facility facility);
    Facility findByID(int id);
    boolean update(Facility facility);
}
