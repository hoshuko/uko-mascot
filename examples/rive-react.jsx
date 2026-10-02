// npm install @rive-app/react-canvas-lite
import { useEffect } from 'react';
import { useRive, useStateMachineInput } from '@rive-app/react-canvas-lite';

const STATE = { idle: 0, loading: 2 };   // Starter (le pack complet ajoute thinking: 1, sleep: 3)

export function UkoRive({ state = 'idle', celebrate = false }) {
  const { rive, RiveComponent } = useRive({ src: '/uko.riv', stateMachines: 'Uko', autoplay: true, autoBind: true });
  const mode = useStateMachineInput(rive, 'Uko', 'state');
  const success = useStateMachineInput(rive, 'Uko', 'success');

  useEffect(() => { if (mode) mode.value = STATE[state] ?? 0; }, [mode, state]);
  useEffect(() => { if (celebrate && success) success.fire(); }, [celebrate, success]);

  return <RiveComponent style={{ width: 240, height: 360 }} />;
}
