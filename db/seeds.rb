
Elevator.delete_all
Call.delete_all

elevator = Elevator.create(name: "first elevator", floor: 5, position: 0, moove_type: "none")

Call.create(elevator_id: elevator.id, call_type: "up", floor_num: 3)
Call.create(elevator_id: elevator.id, call_type: "up", floor_num: 3)
