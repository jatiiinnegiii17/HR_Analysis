import kagglehub
from pathlib import Path
import shutil

DATASET = "rashadalaa/hr-dataset-clean-and-raw-2m-rows"

def download_dataset():
    print("Downloading dataset from Kaggle...")

    path = kagglehub.dataset_download(DATASET)

    print(f"Dataset downloaded to: {path}")

    return Path(path)


if __name__ == "__main__":
    download_dataset()
