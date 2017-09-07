package com.ibm.app.schedule;

import org.springframework.scheduling.annotation.Scheduled;

public class CommonJobsSchedule {

	@Scheduled(fixedRate = 100000)
	public void sendEmail() 
	{
		System.out.println("Email sending schedule...");
	}
	
	@Scheduled(fixedRate = 100000)
	public void validateUser() 
	{
		System.out.println("Validate user schedule...");
	}
	
	//@Scheduled(cron="* * * * * 4")
	public void databaseBackup() 
	{
		System.out.println("Data backup scheduler...");
	}
	
	
}