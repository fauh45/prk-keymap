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
                                                    # Col 3 K18         # Col 3 K17         # Col 3 K16         # R Col 3 K16           # R Col 3 K 17          # R COL 3 K 18          # R COL 1 ENC1 Click
        [ nil,                  nil,                [ col3, row3 ],     [ col3, row2 ],     [ col3, row1 ],     [ r_col3, r_row1 ],     [ r_col3, r_row2 ],     [ r_col3, r_row3 ],     [ r_row4, r_col1 ],     nil                ]
    ]                                                   
)

kbd.add_layer :default, %i[
  KC_Q      KC_W      KC_E        KC_R        KC_T            KC_Y        KC_U        KC_I        KC_O        KC_P
  LGUI_T_A  LALT_T_S  LCTL_T_D    LSFT_T_F    KC_G            KC_H        LSFT_T_J    LCTL_T_K    LATL_T_L    LGUI_T_QUOT
  LT_BTN_Z  RALT_T_X  KC_C        KC_V        KC_B            KC_N        KC_M        KC_COMMA    RALT_T_DOT  LT_BTN_SLSH
                      LT_MED_ESC  LT_NAV_SPC  LT_MOU_TAB      LT_SYM_ENT  LT_NUM_BSPC LT_FUN_DEL  KC_MPLY
]

kbd.define_mode_key :LGUI_T_A,    [ :KC_A,     :KC_LGUI,    500, 200 ]
kbd.define_mode_key :LT_BTN_Z,    [ :KC_Z,     :btn_layer,  500, 200 ]
kbd.define_mode_key :LALT_T_S,    [ :KC_S,     :KC_LALT,    500, 200 ]
kbd.define_mode_key :RALT_T_X,    [ :KC_X,     :KC_RALT,    500, 200 ]
kbd.define_mode_key :LCTL_T_D,    [ :KC_D,     :KC_LCTL,    500, 200 ]
kbd.define_mode_key :LT_FUN_DEL,  [ :KC_DEL,   :func_layer, 500, 200 ]
kbd.define_mode_key :LSFT_T_F,    [ :KC_F,     :KC_LSFT,    500, 200 ]
kbd.define_mode_key :LT_NUM_BSPC, [ :KC_BSPC,  :num_layer,  500, 200 ]
kbd.define_mode_key :LT_SYM_ENT,  [ :KC_ENT,   :sym_layer,  500, 200 ]
kbd.define_mode_key :LT_MOU_TAB,  [ :KC_TAB,   :mou_layer,  500, 200 ]
kbd.define_mode_key :LSFT_T_J,    [ :KC_J,     :KC_LSFT,    500, 200 ]
kbd.define_mode_key :LT_NAV_SPC,  [ :KC_SPC,   :nav_layer,  500, 200 ]
kbd.define_mode_key :LCTL_T_K,    [ :KC_K,     :KC_LCTL,    500, 200 ]
kbd.define_mode_key :LT_MED_ESC,  [ :KC_ESC,   :med_layer,  500, 200 ]
kbd.define_mode_key :LATL_T_L,    [ :KC_L,     :KC_LALT,    500, 200 ]
kbd.define_mode_key :RALT_T_DOT,  [ :KC_DOT,   :KC_RALT,    500, 200 ]
kbd.define_mode_key :LGUI_T_QUOT, [ :KC_QUOT,  :KC_LGUI,    500, 200 ]
kbd.define_mode_key :LT_BTN_SLSH, [ :KC_SLSH,  :btn_layer,  500, 200 ]

kbd.add_layer :nav_layer, %i[
  BOOTSEL   KC_NO   KC_NO   KC_NO       KC_NO         KC_AGAIN    KC_PASTE    KC_COPY   KC_CUT    KC_UNDO
  KC_LGUI   KC_LALT KC_LCTL KC_LSFT     KC_NO         KC_CAPS     KC_LEFT     KC_DOWN   KC_UP     KC_RIGHT
  KC_NA     KC_RALT KC_NO   KC_NO       KC_NO         KC_INS      KC_HOME     KC_PGDN   KC_PGUP   KC_END
                    KC_NO   LT_NAV_SPC  KC_NO         KC_NO       KC_NO       KC_NO     KC_MPLY
]

kbd.define_mode_key :BOOTSEL, [ nil, Proc.new { kbd.bootsel! }, 700, nil ]

kbd.add_layer :mou_layer, %i[
  BOOTSEL   KC_NO   KC_NO   KC_NO       KC_NO         KC_AGAIN    KC_PASTE    KC_COPY   KC_CUT    KC_UNDO
  KC_LGUI   KC_LALT KC_LCTL KC_LSFT     KC_NO         KC_MS_L     KC_MS_D     KC_MS_U   KC_MS_R   KC_NO
  KC_NA     KC_RALT KC_NO   KC_NO       KC_NO         KC_WH_L     KC_WH_D     KC_WH_U   KC_WH_R   KC_NO
                    KC_NO   LT_NAV_SPC  LT_MOU_TAB    KC_BTN2     KC_BTN1     KC_BTN3    KC_MPLY
]

kbd.add_layer :btn_layer, %i[
  KC_UNDO   KC_CUT    KC_COPY   KC_PASTE    KC_AGAIN        KC_AGAIN    KC_PASTE    KC_COPY   KC_CUT    KC_UNDO
  KC_LGUI   KC_LALT   KC_LCTL   KC_LSFT     KC_NO           KC_NO       KC_LSFT     KC_LCTL   KC_LALT   KC_LGUI
  LT_BTN_Z  KC_CUT    KC_COPY   KC_PASTE    KC_AGAIN        KC_AGAIN    KC_PASTE    KC_COPY   KC_CUT    LT_BTN_SLSH
                      KC_BTN3   KC_BTN1     KC_BTN2         KC_BTN2     KC_BTN1     KC_BTN3   KC_MPLY
]

kbd.add_layer :med_layer, %i[
  BOOTSEL   KC_NO     KC_NO       KC_NO       KC_NO         RGB_MOD     RBG_HUI     KC_SAI    RGB_VAI   RGB_TOG
  KC_LGUI   KC_LALT   KC_LCTL     KC_LSFT     KC_NO         KC_MPRV     KC_VOLD     KC_VOLU   KC_MNXT   KC_NO
  KC_NA     KC_RALT   KC_NO       KC_NO       KC_NO         KC_NO       KC_NO       KC_NO     KC_NO     KC_NO
                      LT_MED_ESC  KC_NO       KC_NO         KC_MSTP     KC_MPLY     KC_MUTE   KC_MPLY
]

kbd.add_layer :num_layer, %i[
  KC_LBRC     KC_7    KC_8    KC_9    KC_RBRC         KC_NO   KC_NO         KC_NO     KC_NO     BOOTSEL
  KC_SCOLON   KC_4    KC_5    KC_6    KC_EQL          KC_NO   KC_LSFT       KC_LCTL   KC_LALT   KC_LGUI
  KC_GRAVE    KC_1    KC_2    KC_3    KC_BSLS         KC_NO   KC_NO         KC_NO     KC_RALT   KC_NO
                      KC_DOT  KC_0    KC_MINUS        KC_NO   LT_NUM_BSPC   KC_NO     KC_MPLY
]

kbd.add_layer :sym_layer, %i[
  KC_LCBR   KC_AMPR   KC_ASTER    KC_LPRN   KC_RCBR         KC_NO       KC_NO     KC_NO     KC_NO     BOOTSEL
  KC_COLON  KC_DLR    KC_PERC     KC_CIRC   KC_PLUS         KC_NO       KC_LSFT   KC_LCTL   KC_LALT   KC_LGUI
  KC_TILD   KC_EXLM   KC_AT       KC_HASH   KC_PIPE         KC_NO       KC_NO     KC_NO     KC_RALT   KC_NO
                      KC_LPRN     KC_RPRN   KC_UNDS         LT_SYM_ENT  KC_NO     KC_NO     KC_MPLY
]

kbd.add_layer :fun_layer, %i[
  KC_F12    KC_F7     KC_F8             KC_F9     KC_PSCREEN          KC_NO   KC_NO     KC_NO       KC_NO     BOOTSEL
  KC_F11    KC_F4     KC_F5             KC_F6     KC_SCROLLLOCK       KC_NO   KC_LSFT   KC_LCTL     KC_LALT   KC_LGUI
  KC_F10    KC_F1     KC_F2             KC_F3     KC_PAUSE            KC_NO   KC_NO     KC_NO       KC_RALT   KC_NO
                      KC_APPLICATION    KC_SPC    KC_TAB              KC_NO   KC_NO     LT_FUN_DEL  KC_MPLY
]

kbd.start!