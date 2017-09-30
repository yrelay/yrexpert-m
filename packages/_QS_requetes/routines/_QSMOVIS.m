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

;%QSMOVIS^INT^1^59547,73882^0
%QSMOVIS ;;03:46 PM  1 Jun 1992; ; 05 May 93 11:49 AM
 
 
 
 N IND,I,REPT
 S REPT="TRAITEMENT"
 S IND="" F I=0:0 S IND=$$NXTRI^%QSTRUC8(REPT,IND) Q:IND=""  I $E(IND)="r" D MAJNBRE G ALLMOD
 
 D MAJREP
ALLMOD 
 N TEMP,GRAP,X,Y,Z,%X,%Y,%Z,REP,LIEN,RAC,TITRE,MODEL
 S REP="TRAITEMENT",LIEN="APPELLE",RAC=""
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(TEMP)
 S GRAP=$$CONCAS^%QZCHAD(TEMP,"G")
 S RAC=$$CONCAS^%QZCHAD(TEMP,"R")
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S MODEL=^[QUI]RQSMODIN($ZP(^[QUI]RQSMODIN("")))
 S X="" F %X=0:0 S X=$$NXTRI^%QSTRUC8(REP,X) Q:X=""  I ($E(X)="r")!($E(X)="l") S:$E(X)="r" @RAC@(X)="" I $$AIR^%QSGE5(REP,X,LIEN) S Y="" F %Y=0:0 S Y=$$NXTRIAO^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)=""
 D UCMOD
 S TITRE="1"_$C(0)_"8"_$C(0)_$$^%QZCHW("REPERTOIRES ET LIENS DU SCHEMA DE DONNEES "_MODEL)
 D ^%QULELU(GRAP,RAC,12,2,UCONT,TITRE)
 K @(TEMP)
 Q
UCMOD 
 S @UCONT@("AUTRE",1)="TRTCTRB^%QSMOVIS"
 S @UCONT@("AUTRE",1,"TXT")=$$^%QZCHW("Individus")
 S @UCONT@("AUTRE",1,"COM")=$$^%QZCHW("Acces aux individus (dans le cas d'un repertoire")
 S @UCONT@("AUTRE",1,"CTR")="B"
 S @UCONT@("AUTRE",2)="TRTTRT^%QSMOVI2"
 S @UCONT@("AUTRE",2,"TXT")=$$^%QZCHW("Traiter")
 S @UCONT@("AUTRE",2,"COM")=$$^%QZCHW("Activation d'un traitement sur un individu du repertoire courant")
 S @UCONT@("AFF")="$$TRTABRV^%QSMOVIS"
 S @UCONT@("INFO")="$$TRTINFO^%QSMOVIS"
 S @UCONT@("FULL")="$$TRTFULL^%QSMOVIS"
 Q
 
TRTCTRB(TP) N TY,OB
 S MODG=0,OKU=1
 S OB=@TP@("O")
 S TY=$E(OB) I TY'="r" D ^%VZEAVT($$^%QZCHW("Vous n'etes pas sur un repertoire ")) Q
 S OB=$E(OB,3,$L(OB))
 D MEM^%QCAMEM
 K (QUI,WHOIS,TY,OB,MODEL) D CURRENT^%IS,VARSYS^%QCSAP
 D QSGBASE($$NOMINT^%QSF(OB))
TRTCTRBF 
 D RMEM^%QCAMEM Q
 Q
TRTCTRV(TP) 
 N D,A
 S D=$$NOML^%QSGES20(@TP@("P"),@TP@("O"),LIEN,@TP@("O"))
 S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D))
 D VISUM^%QSATTRI(D,A,5,2,70,18,0)
 S MODG=0,OKU=1
 Q
 
TRTABRV(RIVX,LG) N GAG,TYP,Aa,AA
 S GAG=@RIVX
 I $E(GAG)="r" Q $E(GAG,3,$L(GAG))
 Q $$MINUS($E(GAG,3,$L(GAG)))
 
TRTFULL(TP) N GAG,TYP,Aa,AA
 S GAG=@TP@("O")
 I $E(GAG)="r" Q $E(GAG,3,$L(GAG))
 Q $$MINUS($E(GAG,3,$L(GAG)))
 
TRTINFO(TP) N OBJ,TY,TYP,OBJA
 S OBJ=@TP@("O"),TY=$E(OBJ),OBJA=$E(OBJ,3,$L(OBJ))
 G:TY="l" TRTIL
 S TYP=$$^%QZCHW("repertoire")
 S RES=1_$C(0)_1_$C(0)_TYP_$C(0)_1_$C(0)_($L(TYP)+2)_$C(0)_OBJA_$C(0)_2_$C(0)_3_$C(0)_"("_$$^%QSCALIN("TRAITEMENT",OBJ,"NOMBRE.INDIVIDUS",1)_" "_$$^%QZCHW("individus)")
 Q RES
TRTIL S RES=1_$C(0)_1_$C(0)_$$^%QZCHW("lien")_" "_$$MINUS($$^%QSCALIN("TRAITEMENT",OBJ,"TYPE.LIEN",1))_" "_OBJA
 S RES=RES_$C(0)_1_$C(0)_40_$C(0)_$S($$^%QSCALIN("TRAITEMENT",OBJ,"LIEN.QUALIFIE",1)'="O":$$^%QZCHW("non"),1:"")_" "_$$^%QZCHW("qualifie")
 S RES=RES_$C(0)_2_$C(0)_2_$C(0)_$$^%QZCHW("lien inverse :")_" "_$$^%QSCALIN("TRAITEMENT",OBJ,"NOM.LIEN.INVERSE",1)
 S RES=RES_$C(0)_2_$C(0)_40_$C(0)_$S($$^%QSCALIN("TRAITEMENT",OBJ,"LIEN.QUALIFIE","INVERSE")'="O":$$^%QZCHW("non"),1:"")_" "_$$^%QZCHW("qualifie")
 Q RES
 
ABRV(RIVX,LG) N GAG S GAG=@RIVX Q GAG
 
 
MINUS(PH) N PHM,Aa,AA S PHM=PH,AA=$A("A"),Aa=$A("a") F AA=AA:1:AA+25 S PHM=$TR(PHM,$C(AA),$C(Aa)),Aa=Aa+1
 Q PHM
 
 
 
MAJREP N IND,REPT,I,MOD,MSG,J,IND2,IND3,TL,SUIT
 S REPT="TRAITEMENT" D KILL
 S MOD=^[QUI]RQSMODIN($ZP(^[QUI]RQSMODIN("z")))
 S IND="" F I=0:1 S IND=$O(^[QUI]RQSMDL1(MOD,IND)) Q:IND=""  S J=$$CREER^%QSGEIND(REPT,"r."_IND,"",1,.MSG) D PA^%QSGESTI(REPT,"r."_IND,"NOMBRE.INDIVIDUS",$$CARD^%QSGEST5($$NOMINT^%QSF(IND)),1)
 D PA^%QSGESTI(REPT,"r."_REPT,"NOMBRE.INDIVIDUS",$$CARD^%QSGEST5($$NOMINT^%QSF(REPT)),1)
 S IND="" F I=0:0 S IND=$O(^[QUI]RQSMDL2(MOD,IND)) Q:IND=""  S IND2="" F J=0:0 S IND2=$O(^[QUI]RQSMDL2(MOD,IND,IND2)) Q:IND2=""  S SUIT=^[QUI]RQSMDL2(MOD,IND,IND2),IND3=$P(SUIT,"^"),TL="HIERARCHIQUE",SUIT=$P(SUIT,"^",2,999) D GUG
 S IND="" F I=0:0 S IND=$O(^[QUI]RQSMDL3(MOD,IND)) Q:IND=""  S IND2="" F J=0:0 S IND2=$O(^[QUI]RQSMDL3(MOD,IND,IND2)) Q:IND2=""  S SUIT=^[QUI]RQSMDL3(MOD,IND,IND2),IND3=$P(SUIT,"^"),TL="RELATIONNEL",SUIT=$P(SUIT,"^",2,999) D GUG
 S IND="" F I=0:0 S IND=$O(^[QUI]RQSMDL4(MOD,IND)) Q:IND=""  S IND2="" F J=0:0 S IND2=$O(^[QUI]RQSMDL4(MOD,IND,IND2)) Q:IND2=""  S TL="INVOLUTIF",IND3=IND,SUIT=^[QUI]RQSMDL4(MOD,IND,IND2) D GUG
 D PA^%QSGESTI(REPT,"r."_REPT,"NOMBRE.INDIVIDUS",$$CARD^%QSGEST5($$NOMINT^%QSF(REPT)),1)
 Q
 
GUG S J=$$CREER^%QSGEIND(REPT,"l."_IND2,"",1,.MSG)
 D PA^%QSGESTI(REPT,"l."_IND2,"TYPE.LIEN",TL,1)
 D PA^%QSGESTI(REPT,"l."_IND2,"NOM.LIEN.INVERSE",$P(SUIT,"^"),1)
 D PA^%QSGESTI(REPT,"l."_IND2,"LIEN.QUALIFIE",$P(SUIT,"^",2),1)
 D PA^%QSGESTI(REPT,"l."_IND2,"LIEN.QUALIFIE",$P(SUIT,"^",3),"INVERSE")
 D ADDS^%QSGEST3(REPT,"r."_IND,"APPELLE",REPT,"l."_IND2)
 D ADDS^%QSGEST3(REPT,"l."_IND2,"APPELLE",REPT,"r."_IND3)
 Q
 
KILL N IND,I,REPT
 S REPT="TRAITEMENT"
 S IND="" F I=0:0 S IND=$$NXTRI^%QSTRUC8(REPT,IND) Q:IND=""  I ($E(IND)="r")!($E(IND)="l") D SX^%QSGESTK(REPT,IND)
 Q
 
MAJNBRE N IND,I,REPT
 S REPT="TRAITEMENT"
 S IND="" F I=0:0 S IND=$$NXTRI^%QSTRUC8(REPT,IND) Q:IND=""  I $E(IND)="r" D PA^%QSGESTI(REPT,IND,"NOMBRE.INDIVIDUS",$$CARD^%QSGEST5($$NOMINT^%QSF($E(IND,3,$L(IND)))),1)
 Q
 
 
QSGBASE(BASI) 
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide ")) Q
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BASI),1,"",21,3,59,7)
L1 D AFF^%QUCHOIP
L2 S OBJ=$$UN^%QUCHOIP I OBJ="" D END^%QUCHOIP Q
 K ^TEMPO($J)
 D MODEAF^%QSATTRI(OBJ,BASI,0,10,80,13,0,"REAFF^%QSMOVIS"),SIGNAL
 K ^TEMPO($J)
 G L1
SIGNAL Q:MODEL=""  Q:'($D(^[QUI]RQSMOD5(MODEL,BASI)))
 D @("^"_$P(^[QUI]RQSMOD5(MODEL,BASI),"^",1)_"("""_BASI_""","""_OBJ_""")") Q
FIN D END^%QUCHOIP
 Q
CAD 
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("GESTION MANUELLE DES INDIVIDUS"))
 Q
 
REAFF N SZ
 D CLEPAG^%VVIDEO,CAD
 S SZ=Z
 S Z=^QX($J)-1 D REAFF^%QUCHOI2
 S Z=Z+1 D REAFF^%QUCHOI2
 S Z=SZ
 D REAFF^%QSATTR6
 Q
 ;

