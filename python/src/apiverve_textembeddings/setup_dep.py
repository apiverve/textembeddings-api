from setuptools import setup, find_packages

setup(
    name='apiverve_textembeddings',
    version='1.2.6',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Text Embeddings turns a sentence, paragraph or short document into a 384-dimension vector that captures its meaning, ready for semantic search, clustering, deduplication and recommendations. Send one text or a batch of up to 32, and add a compare text to get the cosine similarity of each one to it in the same call.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/textembeddings?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
