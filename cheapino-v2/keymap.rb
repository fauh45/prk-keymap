require "consumer_key"

kbd = Keyboard.new

# Got it by matching J_1_LEFT1 pins to J_2_RIGHT1
# e.g. R_COL_1 in pin 2 on J_1_LEFT1 connected to R_ROW_4 in pin 2 on J_2_RIGHT1
r_row1 = 3
r_row2 = 1
r_row3 = 2
r_row4 = 0

row4 = 8
row3 = 29
row2 = 28
row1 = 27

r_col1 = 6
r_col2 = 5
r_col3 = 4

col3 = 26
col2 = 15
col1 = 14

rgb = RGB.new(
  16,    # pin number
  1,    # size of underglow pixel
  0,   # size of backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
rgb.effect     = :static
rgb.hue        = 10 # 0-100 / default: 0
rgb.saturation = 100 # 0-100 / default: 100
rgb.value      = 20 # 1-31  / default: 13

kbd.append rgb

kbd.init_matrix_pins(
    [
        ### LEFT SIDE ###                                                                                       ### RIGHT SIDE ###
        # Col 3 K13 - K15       # Col 2 K10 - K12   # Col 2 K7 - K9     # Col 1 K4 - K6     # Col 1 K1 - K3     # R Col 1 K1 - K3       # R Col 1 K4 - K6       # R Col 2 K7 - K9       # R Col 2 K10 - K12     # R Col 3 K13 - K 15
        [ [ row1, col3 ],       [ col2, row1 ],     [ row1, col2 ],     [ col1, row1 ],     [ row1, col1 ],     [ r_row1, r_col1 ],     [ r_col1, r_row1 ],     [ r_row1, r_col2 ],     [ r_col2, r_row1 ],     [ r_row1, r_col3 ] ],
        [ [ row2, col3 ],       [ col2, row2 ],     [ row2, col2 ],     [ col1, row2 ],     [ row2, col1 ],     [ r_row2, r_col1 ],     [ r_col1, r_row2 ],     [ r_row2, r_col2 ],     [ r_col2, r_row2 ],     [ r_row2, r_col3 ] ],
        [ [ row3, col3 ],       [ col2, row3 ],     [ row3, col2 ],     [ col1, row3 ],     [ row3, col1 ],     [ r_row3, r_col1 ],     [ r_col1, r_row3 ],     [ r_row3, r_col2 ],     [ r_col2, r_row3 ],     [ r_row3, r_col3 ] ],
          # ENC1 Left           # ENC1 Right        # Col 3 K18         # Col 3 K17         # Col 3 K16         # R Col 3 K16           # R Col 3 K 17          # R COL 3 K 18          # R COL 1 ENC1 Click
        [ [ r_row4, r_col3 ],   [ r_row4, r_col2 ], [ col3, row3 ],     [ col3, row2 ],     [ col3, row1 ],     [ r_col3, r_row1 ],     [ r_col3, r_row2 ],     [ r_col3, r_row3 ],     [ r_row4, r_col1 ],     nil                ]
    ]                                                   
)

kbd.add_layer :default, %i[
    KC_Q    KC_W    KC_E    KC_R    KC_T            KC_Y    KC_U    KC_I        KC_O    KC_P
    KC_A    KC_S    KC_D    KC_F    KC_G            KC_H    KC_J    KC_K        KC_L    KC_SCOLON
    KC_Z    KC_X    KC_C    KC_V    KC_B            KC_N    KC_M    KC_COMMA    KC_DOT  KC_SLASH
    KC_DOWN KC_UP   KC_ESC  KC_TAB  KC_BSPC         KC_SPC  KC_DEL  KC_ENT      KC_MPLY
]

kbd.start!