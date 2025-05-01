import { prismaClient } from "db/client";

export default async function Home() {
  const users = await prismaClient.user.findMany();
  return (
    <div>
      <div>hi</div>
      {JSON.stringify(users)}
    </div>
  );
}