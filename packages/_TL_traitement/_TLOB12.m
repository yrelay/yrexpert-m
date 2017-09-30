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

;%TLOB12^INT^1^59547,74030^0
%TLOB12 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TOTEML(IDEB,NBREG) 
 N ZLILA,L,ADRL,LATT,OATT,BASEL,BATCH,TAB125
 N VALOBJL,I,NBTOT,NBTC,ADLIST,PREM,EXISTEL
 N KEEPIDT
 S L=V(IDEB+1)
 S BASEL=$$^%QSCALVA("L0",L,"BASE")
 S ADLIST=$$^%QSCALVA("L0",L,"ADRESSE")
 S ZLILA=V(IDEB)
 S NBTOT=$$^%QSCALVA("L0",L,"CARD"),NBTC=1,PREM=1,VALOBJL=$$^%QSCALVA("L0",L,"OBJET.TOTEM")
 S EXISTEL=$S(VALOBJL'="":1,1:0)
 K ^TRAITES($J) S ^TRAITES($J,"CARD")=1
 I (ZLILA="")!(ZLILA="*") S LATT=ZLILA G ACTOT
 S ADRL=$$LIST^%QMLILA(ZLILA)
 S LATT=$S(ADRL="":"*",1:"LISTE")
 
 S OATT=""
 F I=0:0 S OATT=$O(@ADRL@(OATT)) Q:(OATT="")!(OATT]"A")  S:@ADRL@(OATT)'="" LATT(@ADRL@(OATT))=""
ACTOT S BATCH=1,CHOIX="SANS DIALOGUE"
 D POCLEPA^%VVIDEO
 S TAB125=$$TEMP^%SGUTIL K @(TAB125)
 D SAUVVAL^%TLUTIL
 D MEMX^%QCAMEM
 S KEEPIDT=LATT=""
 D BEG2^TORQSIDF
 D 80^%VVIDEO
 F I="WHOIS","QUI","BASEL","L","ZLILA","LATT","ADR","NOML","BATCH","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125)
ACTOT1 D CURRENT^%IS,VARSYS^%QCSAP
 D T0^TORQSB01(L,.LATT)
 K  D RMEMX^%QCAMEM
 I L["zzz" D DEL^%QSGES11(L)
 D RESTVAL^%TLUTIL
 D CLEPAG^%VVIDEO
 K @(TAB125)
 S I=$$^%QSCALIN("L0",L,"LISTE.ERREURS",1) I I'="",$$EXILIS^%QS0XG1(I),$$^%QSCALIN("L0",I,"CARD",1)=0 D ELIML^%QS0XG1(I),PSO^%QSGESTI("L0",L,"LISTE.ERREURS",1)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEMAND(IDEB,NBREG) 
 N NBATT,I,ATTRIBUT
 S NBATT=NBREG/5,I=-1
BDMD D POCLEPA^%VVIDEO
 S I=I+1
 I NBATT=I G FDMD
 S ATTRIBUT=V(IDEB+(I*5))
 I V((IDEB+(I*5))+1)'=1 S ATTRIBUT=ATTRIBUT_"("_V((IDEB+(I*5))+1)_")"
 S RES=$$DATA^%VZAME1(ATTRIBUT_" = ",V((IDEB+(I*5))+4))
 I (RES="")!(RES=V((IDEB+(I*5))+4)) G BDMD
 S BID=$$AFF^%TLOPT(V((IDEB+(I*5))+2),V((IDEB+(I*5))+3),V(IDEB+(I*5)),V((IDEB+(I*5))+1),RES)
 G BDMD
FDMD Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MOZART(IDEB,NBREG) 
 N RE,OBB,PGM,NG
 S RE=V(IDEB)
 S OBB=V(IDEB+1)
 
 
 I '($$IR^%QSGEST5(RE,OBB)),'($$CREOP) S ECHEC=1 Q
 I $$GI^%MZQS'=RE S NG=$$NOMLOG^%QSF(RE) D GET^%MZREP
 D:'($D(^[QUI]MOZPARA("GRILLE","TRAZOM"))) ^%MZGAM4
 D:'($D(^[QUI]MOZ("GRILLE","TRAZOM"))) INIT^%MZGAM4
 D MEM^%QCAMEM K (WHOIS,QUI,OBB)
 S PGM=OBB,HOST=$$TABID^%INCOIN("ORDINATEUR")
 D CURRENT^%IS,VARSYS^%QCSAP
 X ^MOZ100
 D RMEM^%QCAMEM
 
 D CLEPAG^%VVIDEO
 Q 1
 
CREOP() 
 N REP,MSG,RANG
 D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("Gamme inexistante, creation de cette derniere"),"N")
 
 S MSG=""
 S REP=$$CREPER^%QSGEIND(RE,OBB,"",.MSG)
 
 Q 1
 
 
 
 
 
 
 
 
 
 
 
DEPOUIL(IDEB,NBREG) 
 N NO,ATT,IND2,REP2,VA,MOD
 S MOD=V(IDEB)
 S IND2=V(IDEB+2),REP2=V(IDEB+1)
 I (REP2="L0")!(REP2="RQS") Q 1
 D:MODEX'=1 DEP(REP2,IND2,MOD) G FINELI
FINELI Q 1
 
DEP(BASE,IND,MODE) 
 N I,ATT,TYPE
 S ATT="" F I=0:0 S ATT=$$NXTRIA^%QSTRUC8(BASE,IND,ATT) Q:ATT=""  D DEP1
 Q
DEP1 I ATT="NOM" Q
 S TYPE=$$TYPE^%QSGEST9(BASE,ATT)
 I (TYPE=3)!(TYPE=1) Q
 I TYPE=2 D:MODE KFILS(BASE,IND,ATT) Q
 I TYPE'=0 Q
 D PSV^%QSGESTI(BASE,IND,ATT)
 Q
KFILS(BASE,IND,ATT) 
 N BASEF,NOMFI
 S BASEF=$$REPD^%QSGEL2(BASE,ATT) I BASEF="" Q
 S ORD=""
NFILS S ORD=$$NXTRIAO^%QSTRUC8(BASE,IND,ATT,ORD) Q:ORD=""
 S NOMFI=$$VALEUR^%QSTRUC8(BASE,IND,ATT,ORD)
 D SX^%QSGESTK(BASEF,IND_","_NOMFI)
 G NFILS
 ;

