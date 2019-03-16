alter table vehicles add constraint scheme_fk foreign key(scheme_id) references schemes(scheme_id);

alter table vehicle_details add constraint cust_fk foreign key(cust_id) references customers(cust_id);

alter table vehicle_details add constraint vehicle_fk foreign key(vehicle_id) references vehicles(vehicle_id);

alter table vehicle_details add constraint rid_fk foreign key(rent_id) references rent_details(rent_id);
