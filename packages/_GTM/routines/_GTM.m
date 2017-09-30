;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     : GTM                                                          !
;! Module      : GTM                                                          !
;! But         : Regrouper les spécificités GTM                               !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;! $ZGBLDIR : Répertoire contenant les globales d'Yexpert                     !
;! $ZDIRECTORY : Répertoire contenant la partition utilisateur                !
;! $ZPROMPT : Prompt en mode direct                                           !
;! $ZROUTINES : Chemin des routines GTM, YXP et partion de travail            !
;!                                                                            !
;! ZSHOW "*" depuis le prompt affiche les variables locals                    !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 14/08/12 ! Création YXPDIST et ZDIRECTORY()               !
;! HL003 ! HL     ! 11/11/15 ! Remplacer /opt/yrelay/ per /home/yrelay/       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

GTM ;
 Q

YXPDIST()
 ;Test> W !,"Reponse : "_$$YXPDIST^%GTM()," - YXPDIST="_YXPDIST
 S YXPDIST=$E($ZGBLDIR,1,$F($ZGBLDIR,"/partitions/")-13)
 ; le répertoire n'existe pas
 ;HL003 I '$L($ZSEARCH(YXPDIST)_$ZSEARCH(YXPDIST)) D NORM^%VVIDEO W !!,YXPDIST_" : inconnu...",!,"CONSEIL : Vérifier la variable $gtmgbldir,",!,"          le repertoire doit etre de la forme : "_"/opt/yrelay/yexpert/4.0.6/partitions/yxp",!! R "[RETURN]",*TMP:180 Q 0
 I '$L($ZSEARCH(YXPDIST)_$ZSEARCH(YXPDIST)) D NORM^%VVIDEO W !!,YXPDIST_" : inconnu...",!,"CONSEIL : Vérifier la variable $gtmgbldir,",!,"          le repertoire doit etre de la forme : "_"/home/yrelay/partitions/yxp",!! R "[RETURN]",*TMP:180 Q 0
 Q 1

ZGBLDIR(PAR)
 ;Test> W !,"Reponse : "_$$ZGBLDIR^%GTM("DMO")," - ZGBLDIR="_$ZGBLDIR
 Q:'$$YXPDIST() 0 ;Tester la presence du repertoire de la distribution Yexpert 
 Q:'$$SEARCH(PAR) 0 ;Tester la presence du repertoire et des fichiers 
 S $ZGBLDIR=YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".gld"
 Q:'$$ZPROMPT() 0 ; Prompt si la partition existe
 Q 1

ZDIRECTORY(PAR)
 ;Test> W !,"Reponse : "_$$ZDIRECTORY^%GTM("DMO")," - ZDIRECTORY="_$ZDIRECTORY
 Q:'$$YXPDIST() 0 ;Tester la presence du repertoire de la distribution Yexpert 
 Q:'$$SEARCH(PAR) 0 ;Tester la presence du repertoire et des fichiers 
 S $ZDIRECTORY=YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals"
 Q 1

ZPROMPT()
 ;Test> W !,"Reponse : "_$$ZPROMPT^%GTM()
 Q:$$DCOUR()="" 0
 S $ZPROMPT=$$DCOUR()_">"
 Q 1

DCOUR() ;Directory courante
 ;Test> W !,"Reponse : "_$$DCOUR^%GTM()
 N DCOUR
 S DCOUR=$RE($P($P($RE($ZGBLDIR),"dlg.",2),"/"))
 ;HL003 I '$D(DCOUR) D NORM^%VVIDEO W !!,"**SEARCH** : La partittion "_PAR_" est inconnu...",!,"CONSEIL : Vérifier la variable $gtmgbldir,",!,"          le repertoire doit etre de la forme : "_"/opt/yrelay/yexpert/4.0.6/partitions/yxp",!! R "[RETURN]",*TMP:180 Q ""
 I '$D(DCOUR) D NORM^%VVIDEO W !!,"**SEARCH** : La partittion "_PAR_" est inconnu...",!,"CONSEIL : Vérifier la variable $gtmgbldir,",!,"          le repertoire doit etre de la forme : "_"/home/yrelay/partitions/yxp",!! R "[RETURN]",*TMP:180 Q ""
 Q DCOUR

SEARCH(PAR)
 ;Test> W !,"Reponse : "_$$SEARCH^%GTM("DMO")
 Q:'$$YXPDIST() 0 ;Tester la presence du repertoire de la distribution Yexpert 
 ; le répertoire n'existe pas
 I '$L($ZSEARCH(YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/")_$ZSEARCH(YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/")) D NORM^%VVIDEO W !!,"**SEARCH** : Le repertoire "_YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals"," est inconnu...",!,"CONSEIL : Modifier le répertoire de votre partition,",!,"          le repertoire doit etre de la forme : "_YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals",!! R "[RETURN]",*TMP:180 Q 0

 ; le répertoire existe mais le fichier .gld n'existe pas
 I '$L($ZSEARCH(YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".gld")_$ZSEARCH(YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".gld")) D NORM^%VVIDEO W !!,"**SEARCH** : Le fichier "_YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".gld"," : inconnu...",!,"CONSEIL : Creer d'abord vos fichiers de partition,",!,"          les fichiers et répertoire doivent etre de la forme : "_YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".gld",!! R "[RETURN]",*TMP:180 Q 0

 ; le répertoire et le fichier .gld existent mais le fichier .dat n'existe pas
 I '$L($ZSEARCH(YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".dat")_$ZSEARCH(YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".dat")) D NORM^%VVIDEO W !!,"**SEARCH** : Le fichier "_YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".gld"," : inconnu...",!,"CONSEIL : Creer d'abord vos fichiers de partition,",!,"          les fichiers et répertoire doivent etre de la forme : "_YXPDIST_"/partitions/"_$$MIN^%VMINUSC(PAR)_"/globals/"_PAR_".dat",!! R "[RETURN]",*TMP:180 Q 0
 Q 1

PARTITION()
 ;Test> W !,"Reponse : "_$$PARTITION^%GTM()
 Q:'$$YXPDIST() 0 ;Tester la presence du repertoire de la distribution Yexpert
 S FIC=YXPDIST_"/tmp/%GTM_"_$J_".tmp"
 I $L($ZSEARCH(FIC)_$ZSEARCH(FIC)) ZSY "rm "_FIC
 ZSY "ls "_YXPDIST_"/partitions >"_FIC
FREAD
 O FIC:(readonly:exception="g BADOPEN")
 U FIC:exception="G EOF"
 F  U FIC R PAR U $P W PAR,!
EOF I '$ZEOF ZM +$ZS
 C FIC
 ;ZSY "rm "_FIC
 Q 1
BADOPEN I $P($ZS,",",1)=2 D  Q 0
 . W !,"Le fichier ",FIC," n'existe pas."
 I $P($ZS,",",1)=13 D  Q 0
 . W !,"Le fichier ",FIC," n'est pas accessible."
 ZM +$ZS
 Q 0
 

