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

;%TLIACR1^INT^1^59547,74029^0
%TLIACR1 ;
 
 
CONFACT 
 
 I %ETUDE="" S %ETUDE=$$POP^%LNKETU G ACT1
 I '($$IR^%QSGE5($$REP^%LNKETU,%ETU)) D:MODAF ADD^%TLIFEN("LOG","  "_%ETUDE_":"_$$^%QZCHW("etude inconnue")) S ECHEC=1 Q
ACT1 S COMPO=$S(COMPO=$$^%QZCHW("SANS.COMPOSANTS"):$$^%QZCHW("NON"),1:$$^%QZCHW("OUI"))
 I L'="" G MAJ
 I (%REP'="")&(%IND'="") G CRELIST
 S %REP=CXT("@","BASE"),%IND=CXT("@","OBJET")
CRELIST 
 
 S L=$$GEN^%QCAPOP("TMP")
 D ^%QSGES11($$NOMINT^%QSF(%REP),L,"TMP",0,"CONFIGURATEUR","")
 D STOCK^%QSGES11(L,%IND)
 S ADLIST=$$^%QSCALVA("L0",L,"ADRESSE"),BASEL=$$^%QSCALVA("L0",L,"BASE")
MAJ D CREER^%LNKETU2(%ETUDE,$$^%QZCHW("creation par traitements"),%REP,%IND,%LIEN,L,%POCHE,%LAT1,%LAT2,COMPO)
 
 
 D NETIDT^%LNKACT2(L,%REP,%POCHE,.OK)
 I '(OK) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("problemes sur la liste")) S ECHEC=1 Q
 
 N BATCH,CHOIX,KEEPIDT
 S NBTOT=$$^%QSCALVA("L0",L,"CARD"),NBTC=1,PREM=1,VALOBJL=$$^%QSCALVA("L0",L,"OBJET.TOTEM")
 S BATCH=1,CHOIX="SANS DIALOGUE",^KLNTOT($J)=1,KEEPIDT=0
 D POCLEPA^%VVIDEO
 D SAUVVAL^%TLUTIL
 D MEMX^%QCAMEM
 D BEG2^TORQSIDF
 D MAJIDT^%LNKACT2(L,%REP,"IDENTIFIE")
 I '(DTM) K (WHOIS,QUI,%REP,BASEL,L,ZLILA,%LAT1,ADLIST,NOML,BATCH) G ACTOT1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TUER")
 K @(TAB125)
 F I="WHOIS","QUI","%REP","BASEL","L","ZLILA","%LAT1","ADLIST","NOML","BATCH" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125)
ACTOT1 D CURRENT^%IS,VARSYS^%QCSAP
 D T0^TORQSB01(L,.%LAT1)
 
 K  D RMEMX^%QCAMEM
 
 
 
 
 D MAJIDT^%LNKACT2(L,%REP,"CONFIGURE")
 
 S I="" F J=1:1 S I=$O(@ADLIST@(I)) Q:I=""  S STATUS=$$^%QSCALVA("ETUDE.TOTEM",$$^%QSCALVA(BASEL,I,"ETUDE.TOTEM"),"STATUS") I STATUS="PB" D:MODAF ADD^%TLIFEN("LOG","  "_I_":"_$$^%QZCHW("probleme d'etude")) S ECHEC=1 Q
 D RESTVAL^%TLUTIL
 
 D TRSF^%LNKACT3(L,%LAT2,COMPO)
 D MAJIDT^%LNKACT2(L,%REP,"TRANSFERE")
 D CLEPAG^%VVIDEO,REAFF^%TLUTIL
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"%ETUDE",%ETUDE,1)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin activation de LINK"))
 K ^KLNTOT($J)
 Q
 
 
TOT N POSS,ATT,LIS,VAL,OR,VLI,IN,VAR,REP2,ATOT,AA,OO,II,RR,VALI,TYP,V
 N REPI,OBJI,NBI,BASE,PREF,GVAL,GLR,AT,L,SUF
 S GLR=$$TEMP^%SGUTIL
 S GVAL=$$TEMP^%SGUTIL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Totalisation"))
 S AT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (AT="")!('(POSS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut qu'il faut totaliser impossible a determiner")) S VAL="",ECHEC=1 Q
 S ATOT=$$RED(ACTI,4)
 I ATOT=0 S L=LISTE G TOT2
 S L=$$SUBST^%ANARBR2(ATOT,.CXT,"ATT^%TLIACT3",.POSS)
 I (L="")!('(POSS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nom de la liste impossible a determiner")) S VAL="",ECHEC=1 Q
 I '($$IR^%QSGE5("L0",L)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inconnue")) S VAL="",ECHEC=1 Q
TOT2 S REPI=$$^%QSCALVA("L0",L,"OBJET")
 S NBI=$$^%QSCALVA("L0",L,"CARD")
 S REPI=$$NOMINT^%QSF(REPI)
 S PREF=$$^%QSCALVA("L0",L,"ADRESSE")
 I '($$AR^%QSGE5(REP,AT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut inconnu pour les individus de la liste")) S VAL="",ECHEC=1 Q
 S NAR=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POSS)
 S SUF=""
TOT3 
 S SUF=$O(@PREF@(SUF))
 I SUF="" G TOT4
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,AT,GVAL,.TYP)
 I @GVAL=0 G TOT3
 S INO="" F %I=1:1 S INO=$O(@GVAL@(INO)) Q:INO=""  S VAL=@GVAL@(INO) S:'($D(@GLR@(INO))) @GLR@(INO)="" S @GLR@(INO)=@GLR@(INO)+VAL
 G TOT3
TOT4 S:NBI=0 NBI=1
 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  S VAL=@GLR@(IVAL) D:MODEX=2 STATT^%TLBAATT("L0",L,NAR,VAL,IVAL,"AJOUT") D:MODAF ADD^%TLIFEN("ATT",NAR_" <-- "_VAL) D:MODEX'=1 PA^%QSGESTI("L0",L,NAR,VAL,IVAL)
 K @(GLR),@(GVAL)
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

