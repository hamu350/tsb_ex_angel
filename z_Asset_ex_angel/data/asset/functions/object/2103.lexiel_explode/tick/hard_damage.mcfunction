#> asset:object/2103.lexiel_explode/tick/hard_damage
#
#
#
# @within function asset:object/2103.lexiel_explode/tick/

# 演出
    particle explosion_emitter ~ ~ ~ 2 4 2 1 20
    particle flame ~ ~10 ~ 10 10 10 1 200
    particle lava ~ ~10 ~ 10 10 10 1 200
    playsound entity.generic.explode hostile @a ~ ~ ~ 1 0
    playsound entity.generic.explode hostile @a ~ ~ ~ 1 1
    playsound entity.generic.explode hostile @a ~ ~ ~ 1 0.5
    playsound entity.blaze.burn neutral @a ~ ~ ~ 1 0
    playsound entity.blaze.burn neutral @a ~ ~ ~ 1 1

# ダメージ
    # 与えるダメージ
    # ex: dmg調整
        data modify storage api: Argument.Damage set value 30.0f
    # 魔法属性
        data modify storage api: Argument.AttackType set value "Magic"
    # 属性
        data modify storage api: Argument.ElementType set value "Fire"
    # ダメージ
        data modify storage api: Argument.MobUUID set from storage asset:context this.MobUUID
        function api:damage/modifier_manual
        execute as @a[tag=!PlayerShouldInvulnerable,distance=..6] run function api:damage/

# ex: デバフを付与
    data modify storage api: Argument.ID set value 614
    data modify storage api: Argument.Stack set value 4
    data modify storage api: Argument.Duration set value 60
    data modify storage api: Argument.FieldOverride.MobUUID set from storage asset:context this.MobUUID
    execute as @a[tag=!PlayerShouldInvulnerable,distance=..3] run function api:entity/mob/effect/give
    function api:entity/mob/effect/reset

# リセット
    function api:damage/reset
    kill @s
