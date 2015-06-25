class people name =
object (self)
  val _name:string = name
  val _hp = 100
  method to_string = "Instance of class people. Name: " ^ name ^ " hp: " ^ (string_of_int _hp)
  method talk = print_endline ("I'm " ^ _name ^ "! Do you know the doctor?")
  method die = print_endline "Aaaarghh!"
  initializer print_endline "A new character appears!"; print_endline self#to_string
end
  
