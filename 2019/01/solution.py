Total_Mass = 0
# PART 1

# with open('input.txt', 'r') as f:
#     Module_Mass = f.read().splitlines()
#     # print(Module_Mass)
#     for Module in Module_Mass:
#         # print(int(Module)
#         Fuel_Req = int(Module) // 3 - 2
#         # print(Fuel_Req)
#         Total_Mass = Fuel_Req + Total_Mass
#     print(Total_Mass)

# PART 1 ANSWER = 3256114

# PART 2 
def Fuel_Requirement(Mass):
    Fuel_Req = int(Mass) // 3 - 2
    if Fuel_Req < 0:
        Fuel_Req = 0
        return Fuel_Req
    else:
        return Fuel_Req
    pass


def Fuel_For_Fuel(Current_Fuel):
    Fuel = Fuel_Requirement(Current_Fuel)
    if Fuel == 0:
        return Fuel
    else:
        Fuel_Fuel = Fuel_For_Fuel(Fuel)
        return Fuel + Fuel_Fuel


def Total_Fuel_Requirement(Mass):
    Module_Fuel = Fuel_Requirement(Mass)
    Module_Fuel_2 = Fuel_For_Fuel(Module_Fuel)
    return Module_Fuel + Module_Fuel_2



with open('input.txt', 'r') as f:
    Modules_Mass = f.read().splitlines()
    for Mass in Modules_Mass:
        Fuel_Req = Total_Fuel_Requirement(Mass)
        Total_Mass = Fuel_Req + Total_Mass
        print(Total_Mass)

# PART 2 ANSWER = 4881302