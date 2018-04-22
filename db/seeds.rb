
Elevator.delete_all
Call.delete_all

elevator = Elevator.create(name: "first elevator", floor: 5, position: 0, direction: "up")
elevator = Elevator.create(name: "second elevator", floor: 3, position: 0, direction: "up")

Call.create(elevator_id: elevator.id, direction: "up", floor_request: 3)
