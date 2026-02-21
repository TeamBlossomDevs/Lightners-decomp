shader_type canvas_item;

uniform float hue_shift_degrees = 50.0; // Range: -180 to +180
uniform float saturation = 100.0;      // Range: 0 to 200 (Paint.NET behavior)

vec3 rgb2hsv(vec3 c) {
    vec4 K = vec4(0., -1./3., 2./3., -1.);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6. * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c) {
    vec3 p = abs(fract(c.xxx + vec3(0., 1./3., 2./3.)) * 6. - 3.);
    return c.z * mix(vec3(1.), clamp(p - 1., 0., 1.), c.y);
}

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    vec3 hsv = rgb2hsv(tex_color.rgb);

    // Apply hue shift
    float hue_shift = hue_shift_degrees / 360.0;
    hsv.x = fract(hsv.x + hue_shift);

    // Apply Paint.NET-style saturation
    // 0 = grayscale, 100 = original, 200 = fully saturated
    float t = clamp(saturation / 100.0, 0.0, 2.0);
    if (t < 1.0) {
        hsv.y = mix(0.0, hsv.y, t);     // Desaturate toward grayscale
    } else {
        hsv.y = mix(hsv.y, 1.0, t - 1.0); // Boost toward full saturation
    }

    vec3 rgb = hsv2rgb(hsv);
    COLOR = vec4(rgb, tex_color.a);
}





//shader_type canvas_item;

//void vertex() {
	// Called for every vertex the material is visible on.
//}

//void fragment() {
	// Called for every pixel the material is visible on.
//}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
