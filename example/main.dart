import 'package:orm/engines/binary.dart';
import 'package:orm/orm.dart';

import '../prisma/dart/client.dart';
import '../prisma/dart/dmmf.dart';

void main() async {
  final engine = BinaryEngine(
    datasource: 'db',
    schema: schema,
    binary: 'prisma/dart/prisma-query-engine',
    url: Uri.parse('postgresql://seven@localhost:5432/prisma-dart'),
  );
  final prisma = PrismaClient(engine: engine);
  await prisma.$connect();

  final query = serializeJsonQuery(
    datamodel: dmmf.datamodel,
    action: JsonQueryAction.aggregate,
    modelName: 'Post',
    args: {
      'select': {
        '_count': {
          "select": {'_all': true}
        },
      },
    },
  );

  final result = await engine.request(query, action: 'aggregatePost');
  print(result);

  await prisma.$disconnect();
}