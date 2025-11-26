shader_type canvas_item;

uniform float speed : hint_range(0.0, 5.0) = 1.0;
uniform float width : hint_range(0.01, 0.5) = 0.15;
uniform vec4 shine_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float intensity : hint_range(0.0, 3.0) = 0.5;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);

    // Animation du temps
    float t = mod(TIME * speed, 4.0);

    // Coordonnée diagonale (de bas-gauche à haut-droit)
    float diag = (UV.x + UV.y) * 0.5;

    // Ligne shiny en diagonale
    float shine = smoothstep(t - width, t, diag) *
                  smoothstep(t + width, t, diag);

    // Ajout du shiny à la couleur finale
    COLOR = tex + shine_color * shine * intensity * tex.a;
}
