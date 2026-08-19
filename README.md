# RATISS Aeon Model Runtime

Ce dépôt privé centralise les **manifestes, empreintes et instructions de démarrage** des modèles locaux utilisés par RATISS Aeon Prime. Les poids binaires publiés avec une release sont des copies de distribution ; la référence de licence et de provenance demeure la carte officielle de l’éditeur.

## Modèle initial

| Modèle | Format | Empreinte de taille | Usage cible |
| --- | --- | --- | --- |
| Qwen2.5 0.5B Instruct Q4_K_M | GGUF | environ 469 Mo sur disque | inférence locale légère, routage, extraction et génération structurée |

## Récupération et intégrité

Téléchargez le fichier `.gguf` depuis la release **Qwen2.5 0.5B Instruct — Q4_K_M**, puis contrôlez-le avec le fichier `SHA256SUMS` publié dans les mêmes assets.

```bash
sha256sum -c SHA256SUMS
```

## Utilisation locale

La voie la plus simple consiste à utiliser Ollama, qui récupère automatiquement la version Q4_K_M :

```bash
ollama run qwen2.5:0.5b-instruct
```

Pour exposer le fichier GGUF par une API compatible OpenAI locale, installez `llama.cpp`, puis exécutez :

```bash
bash scripts/run-qwen-local.sh ./qwen2.5-0.5b-instruct-q4_k_m.gguf
```

L’API locale sera disponible sur `http://127.0.0.1:8080/v1`.

## Pourquoi ne pas versionner le binaire dans Git ?

Les poids de plusieurs centaines de Mo ne sont pas adaptés aux commits Git ordinaires. La release fournit un téléchargement versionné et reproductible, tandis que le dépôt conserve la documentation, le manifeste, l’empreinte et les scripts nécessaires à l’exploitation.

## Provenance et licence

Le modèle provient du dépôt officiel [Qwen2.5-0.5B-Instruct-GGUF](https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF). Qwen indique une licence **Apache-2.0** pour cette variante 0.5B. Avant toute redistribution commerciale, vérifiez les termes en vigueur de l’éditeur.
