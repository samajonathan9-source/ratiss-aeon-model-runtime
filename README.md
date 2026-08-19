# RATISS Aeon Model Runtime

Ce dépôt privé centralise les **manifestes, empreintes et instructions de démarrage** des modèles locaux utilisés par RATISS Aeon Prime. Les poids binaires publiés avec une release sont des copies de distribution ; la référence de licence et de provenance demeure la carte officielle de l’éditeur.

## Modèles disponibles

| Modèle | Format | Empreinte de taille | Usage cible |
| --- | --- | --- | --- |
| Qwen2.5 0.5B Instruct Q4_K_M | GGUF | environ 469 Mo sur disque | inférence locale légère, routage, extraction et génération structurée |
| Qwen2.5 1.5B Instruct Q4_K_M | GGUF | environ 1,1 Go sur disque | raisonnement local plus riche, sorties structurées et tâches multilingues |

## Récupération et intégrité

Téléchargez le fichier `.gguf` depuis la release correspondant au modèle choisi, puis contrôlez-le avec le fichier SHA-256 publié dans les mêmes assets.

```bash
sha256sum -c SHA256SUMS
```

## Utilisation locale

La voie la plus simple consiste à utiliser Ollama, qui récupère automatiquement la version Q4_K_M :

```bash
ollama run hf.co/Qwen/Qwen2.5-1.5B-Instruct-GGUF:Q4_K_M
```

Pour exposer le fichier GGUF par une API compatible OpenAI locale, installez `llama.cpp`, puis exécutez :

```bash
bash scripts/run-qwen-local.sh ./qwen2.5-1.5b-instruct-q4_k_m.gguf
```

L’API locale sera disponible sur `http://127.0.0.1:8080/v1`.

## Pourquoi ne pas versionner le binaire dans Git ?

Les poids de plusieurs centaines de Mo ne sont pas adaptés aux commits Git ordinaires. La release fournit un téléchargement versionné et reproductible, tandis que le dépôt conserve la documentation, le manifeste, l’empreinte et les scripts nécessaires à l’exploitation.

## Provenance et licence

Les modèles proviennent des dépôts officiels [Qwen2.5-0.5B-Instruct-GGUF](https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF) et [Qwen2.5-1.5B-Instruct-GGUF](https://huggingface.co/Qwen/Qwen2.5-1.5B-Instruct-GGUF). Qwen indique une licence **Apache-2.0** pour ces variantes. Avant toute redistribution commerciale, vérifiez les termes en vigueur de l’éditeur.
