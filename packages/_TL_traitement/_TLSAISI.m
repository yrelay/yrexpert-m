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
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLSAISI^INT^1^59547,74031^0
%TLSAISI(TTT) 
 
 
 
 
 
 
 
 
 N %PROVEN,C,I,LC,LT,TABC,ROUTREAF,AVEC
 S %PROVEN="TRT",ROUTREAF="REAFINS^%TLSAISI",(LC,LT,AVEC(1),AVEC(0))=1
 S AVEC(2)=0
 G 18
LL S TABC(1)="COMMENTAIRE",TABC(2)="TRAITEMENT "_$S(AVEC(1):"AVEC ANALYSE",1:"SANS ANALYSE"),TABC(4)="ARBRE "
L0 S TABC(3)="AVEC/SANS ANALYSE"
 D POCLEPA^%VVIDEO S C=$$^%VZECHO("TABC")
 F I=1,6,8,10,18,"COMMENTAIRE","TRAITEMENT SANS ANALYSE","TRAITEMENT AVEC ANALYSE","AVEC/SANS ANALYSE","ARBRE " I I=C S I=$E(I,1,4) G @I
 D ^%VSQUEAK G L0
1 D FIN Q
6 D FIN Q
8 D ^%TLAIDE G L0
10 D ^%TLIMPRI(TTT) G LL
18 D REAFFI G LL
 
COMM D ^%QULIMO(0,3,80,5,"^[QUI]TTL("""_TTT_""",1)",.LC,"ADDCOM^%TLSAISI","SUPCOM^%TLSAISI") G LL
 
TRAI D ZLISTE2^%QULIMO(0,8,80,15,"^[QUI]TTL("""_TTT_""",2)",.LT,"ADDTTM^%TLSAISI","SUPTTM^%TLSAISI","^%TLAIDE")
 G LL
ARBR D TRT^%QULELT("t."_TTT),REAFFI G LL
 
 
 
 
 
AVEC I AVEC(1)=1 S AVEC(1)=0,AVEC(0)=0 G LL
 S AVEC(1)=1 G LL
 
 
 
FIN D MSG^%VZEATT($$^%QZCHW("Sauvegarde en cours"))
 D MAJ^%TLGEST(TTT,AVEC(2),AVEC(0)&AVEC(2),$$OKANA^%TLGEST(TTT)&((AVEC(0)=1)!(AVEC(2)=0)))
 D MAJCOM^%TLGEST(TTT)
 I AVEC(2) D KILLCOMP^%TLOGCMP(TTT) K ^[QUI]BAPLAN(TTT)
 
 I AVEC(2),$$OKANA^%TLGEST(TTT) S AVEC(2)=$$COMPTRT^%TLOCMP(TTT,0)
 Q
REAFFI D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,"^[QUI]TTL("""_TTT_""",1)",0,3,80,5)
 D REAFF^%QULIMO3(1,1,"^[QUI]TTL("""_TTT_""",2)",0,8,80,15)
 Q
ADDCOM S OK=1 Q
SUPCOM S OK=1 Q
 
ADDTTM 
 I AVEC(1)=0 S OK=1,AVEC(2)=1 Q
 N POSIT,RA,SAVY1,SX,SY,VVDX,VVDY,VVYB,VVYH,VVPA,VVTX,ATTD,APPD,APPEX,%IC
 K ^SANAREQ($J)
 S SAVY1=Y1,SX=DX,SY=DY,POSIT=1,ATTD=0,APPD=0,APPEX=0 D INIT^%AN7(SX,SY)
 S RA=$$VAL^%QULIMO("TETE") D:(RA'="")&(CTR'="D") KILL^%ANA(RA)
 S OK=$$LIGN^%AN15(Y1,.POSIT,.RA) D END^%AN7
 I '(OK) D ^%VSQUEAK,KILL^%ANA(RA) G FINSI2
 
 F %IC=1:1 Q:$$VAL^%QULIMO("ATTRIBUT."_%IC)=""  D DEL^%QULIMO("ATTRIBUT."_%IC)
 F %IC=1:1 Q:$$VAL^%QULIMO("APPEL."_%IC)=""  D DEL^%QULIMO("APPEL."_%IC)
 D AFF^%QULIMO("TETE",RA)
 D AFF^%QULIMO("NBR.ATTRIBUTS",ATTD)
 D AFF^%QULIMO("NBR.APPELS",APPD)
 D AFF^%QULIMO("NBR.APPELS.CALCULES",APPEX)
 F %IC=1:1:ATTD D AFF^%QULIMO("ATTRIBUT."_%IC,ATTD(%IC))
 F %IC=1:1:APPD D AFF^%QULIMO("APPEL."_%IC,APPD(%IC))
FINSI2 K ATTD,APPD
 S Y1=SAVY1,DX=SX,DY=SY,AVEC(2)=1
 Q
 
SUPTTM 
 I AVEC(1)=0 S OK=1,AVEC(2)=1 Q
 N RA
 S RA=$$VAL^%QULIMO("TETE")
 D:RA'="" KILL^%ANA(RA)
 S OK=1,AVEC(2)=1
 Q
 
CADR N VERS
 D ^%VZCD(0,79,0,2,0,0,TTT)
 S VERS=$$GETVAL^%TLGEST(TTT,"CARD",1)
 I VERS'="" S DX=3,DY=2 X XY D REV^%VVIDEO W $$^%QZCHW("version")_" "_VERS_"    ("_$$GETVAL^%TLGEST(TTT,"AUTEUR",1)_" "_$$^%QZCHW("le")_" "_$$GETVAL^%TLGEST(TTT,"DATE.DERNIERE.MODIFICATION",1)_")" D NORM^%VVIDEO
 D CARSP^%VVIDEO(0,3,5,80,0)
 S DX=38,DY=3 X XY W $$^%QZCHW(" Commentaire ")
 D CARSP^%VVIDEO(0,8,15,80,0)
 S DX=38,DY=8 X XY W $$^%QZCHW(" Pour chaque individu de la liste faire ")
 Q
REAFINS 
 
 D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,"^[QUI]TTL("""_TTT_""",1)",0,3,80,5)
 D A18^%QULIMO4
 D REAFF^%AN7
 Q

