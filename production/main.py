import board

from kmk.kmk_keyboard import KMKKeyboard
from kmk.keys import KC
from kmk.modules.encoder import EncoderHandler
from kmk.scanners import DiodeOrientation


keyboard = KMKKeyboard()
keyboard.row_pins = (board.D0, board.D1)
keyboard.col_pins = (board.D2, board.D3, board.D4)
keyboard.diode_orientation = DiodeOrientation.COL2ROW

encoder_handler = EncoderHandler()
keyboard.modules.append(encoder_handler)
encoder_handler.pins = ((board.D8, board.D9, board.D10, False),)
encoder_handler.map = [
    ((KC.VOLD, KC.VOLU, KC.MUTE),),
]

keyboard.keymap = [
    [KC.ESC, KC.LCTL(KC.C), KC.LCTL(KC.V), KC.LCTL(KC.Z), KC.LCTL(KC.S), KC.ENT],
]


if __name__ == "__main__":
    keyboard.go()

