package pojo;

// Generated Jun 14, 2015 12:46:58 AM by Hibernate Tools 3.4.0.CR1

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import pojo.Employee;

/**
 * Thematic generated by hbm2java
 */
@Entity
@Table(name = "Thematic")
public class Thematic implements java.io.Serializable
{

	private int thematicId;
	private Employee employee;
	private String thematicName;
	private String contentDescription;
	private String trainers;
	private String documents;
	private Set<RegistrationInfomation> registrationInfomations = new HashSet<RegistrationInfomation>(
			0);
	private Set<Classe> classes = new HashSet<Classe>(0);

	public Thematic() {
	}

	public Thematic(int thematicId, Employee employee) {
		this.thematicId = thematicId;
		this.employee = employee;
	}
	public Thematic(int thematicId, Employee employee, String thematicName,
			String contentDescription, String trainers, String documents,
			Set<RegistrationInfomation> registrationInfomations,
			Set<Classe> classes) {
		this.thematicId = thematicId;
		this.employee = employee;
		this.thematicName = thematicName;
		this.contentDescription = contentDescription;
		this.trainers = trainers;
		this.documents = documents;
		this.registrationInfomations = registrationInfomations;
		this.classes = classes;
	}

	@Id
	@Column(name = "ThematicID", unique = true, nullable = false)
	public int getThematicId()
	{
		return this.thematicId;
	}

	public void setThematicId(int thematicId)
	{
		this.thematicId = thematicId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ManagerID")
	public Employee getEmployee()
	{
		return this.employee;
	}
	/*
	public Employee getManager()
	{
		return this.getEmployee();
	}
	*/
	public void setEmployee(Employee employee)
	{
		this.employee = employee;
	}
/*	public void setManager(Employee emp)
	{
		this.setEmployee(emp);
	}
	*/
	@Column(name = "ThematicName")
	public String getThematicName()
	{
		return this.thematicName;
	}

	public void setThematicName(String thematicName)
	{
		this.thematicName = thematicName;
	}

	@Column(name = "ContentDescription")
	public String getContentDescription()
	{
		return this.contentDescription;
	}

	public void setContentDescription(String contentDescription)
	{
		this.contentDescription = contentDescription;
	}

	@Column(name = "Trainers")
	public String getTrainers()
	{
		return this.trainers;
	}

	public void setTrainers(String trainers)
	{
		this.trainers = trainers;
	}

	@Column(name = "Documents")
	public String getDocuments()
	{
		return this.documents;
	}

	public void setDocuments(String documents)
	{
		this.documents = documents;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "thematic")
	public Set<RegistrationInfomation> getRegistrationInfomations()
	{
		return this.registrationInfomations;
	}

	public void setRegistrationInfomations(
			Set<RegistrationInfomation> registrationInfomations)
	{
		this.registrationInfomations = registrationInfomations;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "thematic")
	public Set<Classe> getClasses()
	{
		return this.classes;
	}

	public void setClasses(Set<Classe> classes)
	{
		this.classes = classes;
	}

}
