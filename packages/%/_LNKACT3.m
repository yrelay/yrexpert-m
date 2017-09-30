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

;%LNKACT3^INT^1^59547,73870^0
%LNKACT3 ;
 
 
 
 
UC(ETU,LIST) 
 N ADR,ERR,REP,ATT S ERR=""
 I ETU="" S ERR=$$^%QZCHW("etude indefinie") G FIN
 I LIST="" S ERR=$$^%QZCHW("liste indefinie") G FIN
 I $$CARD^%QSGEST7(LIST)=0 S ERR=$$^%QZCHW("liste vide") G FIN
 S ADR=$$ADRLIS^%QSGEST7(LIST)
 I ADR="" S ERR=$$^%QZCHW("impossible de trouver les individus selectionnes") G FIN
 S REP=$$^%QSCALVA("L0",LIST,"BASE") I REP="" S ERR=$$^%QZCHW("impossible de trouver les individus de la liste") G FIN
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  I $$^%QSCALVA(REP,OB,"IDENTIFIANT.TOTEM")="" S ERR=OB_" : "_$$^%QZCHW("a identifier") Q
 I ERR'="" G FIN
 I $$^%QSCALVA($$REP^%LNKETU,ETU,"POCHE")="" G UC1
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  I $$^%QSCALVA(REP,OB,"OBJET.TOTEM")'=$$^%QSCALVA($$REP^%LNKETU,ETU,"POCHE") S ERR=OB_" : "_$$^%QZCHW("erreur sur l'attribut")_" "_"OBJET.TOTEM" Q
 G FIN
UC1 
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  S ATT=$$^%QSCALVA(REP,OB,"OBJET.TOTEM") I ATT="" S ERR=OB_" : "_$$^%QZCHW("erreur sur l'attribut")_" "_"OBJET.TOTEM" Q
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  S ATT=$$^%QSCALVA(REP,OB,"OBJET.TOTEM") I ATT="" S ERR=OB_" : "_$$^%QZCHW("erreur sur l'attribut")_" "_"OBJET.TOTEM" Q
 
FIN Q ERR
 
UCT(ETU,LIST) 
 N ADR,ERR,REP,ATT S ERR=""
 I ETU="" S ERR=$$^%QZCHW("etude indefinie") G FIN
 I LIST="" S ERR=$$^%QZCHW("liste indefinie") G FIN
 I $$CARD^%QSGEST7(LIST)=0 S ERR=$$^%QZCHW("liste vide") G FIN
 S ADR=$$ADRLIS^%QSGEST7(LIST)
 I ADR="" S ERR=$$^%QZCHW("impossible de trouver les individus selectionnes") G FIN
 S REP=$$^%QSCALVA("L0",LIST,"BASE") I REP="" S ERR=$$^%QZCHW("impossible de trouver les individus de la liste") G FIN
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  I $$^%QSCALVA(REP,OB,"IDENTIFIANT.TOTEM")="" S ERR=OB_" : "_$$^%QZCHW("a identifier") Q
 I ERR'="" G FUCT
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  I $$^%QSCALVA(REP,OB,"ETUDE.TOTEM")="" S ERR=OB_" : "_$$^%QZCHW("a configurer") Q
 I ERR'="" G FUCT
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  I '($$AIR^%QSGE5(REP,OB,"ETUDE.TOTEM")) S ERR=OB_" : "_$$^%QZCHW("etude LINK inconnue") Q
FUCT 
 Q ERR
IDT(LL2) 
 I '(DTM) N (WHOIS,QUI,LL2) G IDT2
 
 D MEMX^%QCAMEM
 
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","LL2","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K @(TAB125)
 
IDT2 
 N L S L=LL2
 D CURRENT^%IS,VARSYS^%QCSAP
 D ^TORQSIDF($$^%QSCALVA("L0",LL2,"BASE"),LL2)
 Q:'(DTM)
 
 D RESTOR
 Q
CNF(L,LATT) 
 I '(DTM) N (WHOIS,QUI,L,LATT) G CNF2
 
 D RMEMX^%QCAMEM
 
 
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","L","LATT","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K @(TAB125)
CNF2 
 D CURRENT^%IS,VARSYS^%QCSAP
 D T0^TORQSB01(L,.LATT)
 Q:'(DTM)
 D RESTOR
 Q
TRSF(L,LATT,NOMENC) 
 I '(DTM) N (WHOIS,QUI,L,LATT,NOMENC) G TRSF2
 
 D MEMX^%QCAMEM
 
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="WHOIS","QUI","L","LATT","NOMENC","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K @(TAB125)
TRSF2 
 D CURRENT^%IS,VARSYS^%QCSAP
 
 N ADR,OB
 S ADR=$$ADRLIS^%QSGEST7(L) I ADR="" D ^%VZEAVT($$^%QZCHW("impossible de trouver les individus selectionnes")) Q
 
 N LETU
 S LETU=$$GEN^%QCAPOP("TMP")
 D ^%QSGES11("ETUDE.TOTEM",LETU,"TMP",0,"","")
 S OB="" F I=0:0 S OB=$O(@ADR@(OB)) Q:OB=""  S ETU=$$^%QSCALVA($$^%QSCALVA("L0",L,"BASE"),OB,"ETUDE.TOTEM") D PA^%QSGESTI("ETUDE.TOTEM",ETU,"NOMENCLATURE",$S(NOMENC="OUI":1,1:0),1),STOCK^%QSGES11(LETU,ETU)
 K ETU
 D ^TORQYT(LATT,LETU)
 D DEL^%QSGES11(LETU)
 Q:'(DTM)
 D RESTOR
 Q
DEL(ETU,LIST) 
 N ADR,ERR,REP,REPIND,ATT,ATTRI,ORD S ERR=""
 I ETU="" S ERR=$$^%QZCHW("etude indefinie") G FDEL
 I LIST="" S ERR=$$^%QZCHW("liste indefinie") G FDEL
 I $$CARD^%QSGEST7(LIST)=0 S ERR=$$^%QZCHW("liste vide") G FDEL
 S ADR=$$ADRLIS^%QSGEST7(LIST)
 I ADR="" D ^%VZEAVT($$^%QZCHW("impossible de trouver les individus selectionnes")) G FDEL
 S REP=$$^%QSCALVA("L0",LIST,"BASE") I REP="" D ^%VZEAVT($$^%QZCHW("impossible de trouver les individus de la liste")) G FDEL
 S ADR2="ETUDE.TOTEM"
 S OB=""
LOOPET S OB=$$NXTRI^%QSTRUC8(ADR2,OB) G:OB="" FDEL
 S ORD=""
LOOPIN S ORD=$$NXTRIAO^%QSTRUC8(ADR2,OB,"INDIVIDU.RECEPTEUR",ORD)
 G:ORD="" LOOPET
 S IND=$$VALEUR^%QSTRUC8(ADR2,OB,"INDIVIDU.RECEPTEUR",ORD)
 I '($D(@ADR@(IND))) G LOOPIN
 D MSG^%VZEATT($$^%QZCHW("suppression de l'etude")_" "_OB)
 S TWREF=0 D SUPEX^TODELDEV(OB)
 
 S REPIND=$$^%QSCALVA($$REP^%LNKETU,ETU,"REPERTOIRE")
 I $$^%QSCALVA(REPIND,IND,"STADE")'="IDENTIFIE" F ATTRI="STADE","STATUT","IDENTIFIANT.TOTEM","ETUDE.TOTEM","MESSAGE.ERREUR" D PSO^%QSGESTI(REPIND,IND,ATTRI,1)
 G LOOPIN
 
FDEL 
 Q
RESTOR D RMEMX^%QCAMEM
 D CURRENT^%IS,VARSYS^%QCSAP
 Q

