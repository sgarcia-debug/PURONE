# PUR ONE — SaaS starter

Interfaz inicial en Next.js + Supabase, pensada para desplegarse en Vercel.

## Incluido
- Registro e inicio de sesión con Supabase Auth.
- Panel de resumen, clientes, tareas, actividad e informes.
- Alta de clientes y tareas; cambio de estado de tareas.
- Exportación de clientes a CSV compatible con Excel.
- Esquema SQL con políticas RLS para que cada usuario solo lea y modifique sus propios registros.
- Diseño responsive.

## Preparación local
1. Instala Node.js 20 o superior.
2. Ejecuta `npm install`.
3. Copia `.env.example` a `.env.local` y completa las credenciales de Supabase.
4. En el SQL Editor de Supabase, ejecuta `supabase/schema.sql`.
5. Ejecuta `npm run dev`.

## Despliegue
1. Sube el contenido del proyecto a un repositorio Git.
2. Importa el repositorio desde Vercel.
3. Añade `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY` en Environment Variables.
4. Despliega.

## Antes de producción
- Configura URLs permitidas y redirecciones de Auth en Supabase.
- Añade recuperación de contraseña, verificación de correo y gestión de sesiones.
- Amplía el modelo de datos (organizaciones/equipos, contactos separados, historial de actividad, oportunidades, permisos y auditoría) según los requisitos comerciales.
- Revisa políticas, límites, copias de seguridad, privacidad y cumplimiento aplicables.
- Este starter no incorpora pagos, planes de suscripción ni integraciones externas específicas.
