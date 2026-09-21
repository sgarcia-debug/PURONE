import type { Metadata } from "next";
import "./globals.css";
export const metadata: Metadata = { title: "PUR ONE | Workspace", description: "La plataforma sencilla para gestionar clientes, tareas y actividad." };
export default function RootLayout({children}:{children:React.ReactNode}) {
 return <html lang="es"><body>{children}</body></html>;
}