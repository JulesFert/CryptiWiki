const creatureData = {
    // Les données de la créature à envoyer
  };
  
  fetch('/api/creatures', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(creatureData),
  })
    .then(response => response.json())
    .then(data => {
      // Traitez les données de la créature créée ici
      console.log(data);
    })
    .catch(error => {
      // Gérez les erreurs de la requête ici
      console.error(error);
    });