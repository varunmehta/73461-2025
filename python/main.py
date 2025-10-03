from hub import light_matrix, port, motion_sensor
import motor_pair
import runloop

async def main():
    # write your code here
    await light_matrix.write("Hi!")

runloop.run(main())


def moveStraight():
    # set yaw to zero at the start of the code 
    motion_sensor.reset_yaw(0)
    motor_pair.pair(motor_pair.PAIR_1, port.A, port.B)
