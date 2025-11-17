shader_type canvas_item;
render_mode blend_mix;

// Paramètres du shine
uniform float shine_speed : hint_range(0.1, 5.0) = 1.5;
uniform float shine_width : hint_range(0.01, 0.5) = 0.15;
uniform float shine_angle : hint_range(-180.0, 180.0) = -45.0;
uniform vec4 shine_color : source_color = vec4(1.0, 1.0, 1.0, 0.8);
uniform float shine_intensity : hint_range(0.0, 2.0) = 1.2;
uniform bool loop_shine = true;
uniform float loop_delay : hint_range(0.0, 5.0) = 2.0;
uniform float alpha = 1.0;

void fragment() {
    // Récupère la couleur de la texture
    vec4 tex_color = texture(TEXTURE, UV);

    // Convertit l'angle en radians
    float angle_rad = radians(shine_angle);

    // Calcule la position du shine avec rotation
    float cos_angle = cos(angle_rad);
    float sin_angle = sin(angle_rad);

    // Coordonnées UV pivotées
    vec2 rotated_uv = vec2(
        UV.x * cos_angle - UV.y * sin_angle,
        UV.x * sin_angle + UV.y * cos_angle
    );

    // Animation du shine
    float time_offset = TIME * shine_speed;
    float shine_active = 1.0;

    // Si loop est activé, ajoute un délai entre les répétitions
    if (loop_shine) {
        float cycle_time = 1.0 + loop_delay;
        time_offset = mod(TIME * shine_speed, cycle_time);
        // Désactive le shine pendant le délai
        shine_active = step(time_offset, 1.0);
    }

    // Position du shine (de -shine_width à 1.0 + shine_width)
    float shine_pos = time_offset * (1.0 + 2.0 * shine_width) - shine_width;

    // Calcule la distance au centre du shine
    float dist = abs(rotated_uv.x - shine_pos);

    // Crée un gradient doux pour le shine
    float shine_amount = smoothstep(shine_width, 0.0, dist) * shine_active;

    // Applique le shine avec la couleur et l'intensité
    vec3 shine = shine_color.rgb * shine_amount * shine_intensity;

    // Mélange avec lerp au lieu d'addition pour respecter le fade
    float shine_factor = shine_amount * shine_color.a;
    COLOR.rgb = mix(tex_color.rgb, tex_color.rgb + shine, shine_factor);
    COLOR.a = min(alpha, tex_color.a);
}