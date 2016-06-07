Shader "Custom/ScreenPos" {
    Properties {
      _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma surface surf NoLighting noforwardadd

      struct Input {
          float2 uv_MainTex;
          float4 screenPos;
          float3 viewDir;
      };

      fixed4 LightingNoLighting (SurfaceOutput s,fixed3 lightDir,fixed atten){
      	return fixed4(0,0,0,0);
      }



      //sampler2D _MainTex;
      sampler2D _MainTex;
      void surf (Input IN, inout SurfaceOutput o) {
        float2 screenUV = (IN.screenPos.xy) / IN.screenPos.w ;

       

 	 	o.Albedo = tex2D (_MainTex, screenUV).rgb;
      }
      ENDCG
    } 
    Fallback "Diffuse"
  }