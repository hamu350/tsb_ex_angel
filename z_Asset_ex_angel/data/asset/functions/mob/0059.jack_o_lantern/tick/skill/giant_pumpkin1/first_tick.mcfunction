#> asset:mob/0059.jack_o_lantern/tick/skill/giant_pumpkin1/first_tick
#
# 最初のTickにやるべきこと
#
# @within function asset:mob/0059.jack_o_lantern/tick/skill/giant_pumpkin1/

# NoAIにする
    data modify entity @s NoAI set value 1b

# 攻撃パターン設定
# ex: パターン追加
    execute store result score $Random Temporary run random value 0..3
    execute if score $Random Temporary matches 0 run tag @s add 1N.GiantPumpkin1.Center
    execute if score $Random Temporary matches 1 run tag @s add 1N.GiantPumpkin1.Left
    execute if score $Random Temporary matches 2 run tag @s add 1N.GiantPumpkin1.Right
    execute if score $Random Temporary matches 3 run tag @s add 1N.GiantPumpkin1.Edge
    scoreboard players reset $Random Temporary
