travel('Medellín', 'Cartagena', 'Avión', 350000).
travel('Cartagena', 'Islas del Rosario', 'Lancha', 150000).
travel('Medellín', 'Bogotá', 'Avión', 350000).
travel('Bogotá', 'Villavicencio', 'Bus', 34000).
travel('Cartagena', 'Barranquilla', 'Bus', 30000).
travel('Barranquilla', 'Santa Marta', 'Carro', 120000).
travel('Santa Marta', 'Islas del Rosario', 'Lancha', 130000).
travel('Medellín', 'Santa Marta', 'Avión', 350000).
travel('Cartagena', 'Santa Marta', 'Avión', 300000).

route(Start, End, Path, SegmentPrices, TransportModes, TotalCost) :-
  route(Start, End, [Start], Path, [], SegmentPrices, [], TransportModes, 0, TotalCost).

route(End, End, Visited, Path, AccumPrices, SegmentPrices, AccumTransports, TransportModes, AccumCost, TotalCost) :-
  reverse(Visited, Path),
  reverse(AccumPrices, SegmentPrices),
  reverse(AccumTransports, TransportModes),
  TotalCost is AccumCost.

route(Start, End, Visited, Path, AccumPrices, SegmentPrices, AccumTransports, TransportModes, AccumCost, TotalCost) :-
  travel(Start, Next, TransportType, Cost),
  \+ member(Next, Visited),
  NewCost is AccumCost + Cost,
  route(Next, End,
        [Next|Visited], Path,
        [Cost|AccumPrices], SegmentPrices,
        [TransportType|AccumTransports], TransportModes,
        NewCost, TotalCost).

query_route(Start, End) :-
  route(Start, End, Path, SegmentPrices, TransportModes, TotalCost),
  write('Recorrido: '), write(Path), nl,
  write('Precios por trayecto: '), write(SegmentPrices), nl,
  write('Tipos de transporte: '), write(TransportModes), nl,
  write('Costo total del viaje: '), write(TotalCost), nl.