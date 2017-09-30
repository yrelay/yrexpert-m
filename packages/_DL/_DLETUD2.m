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

;%DLETUD2^INT^1^59547,73867^0
DLETUD2 ;
 
 
 
 
 
 
SUP(NOM) 
 N %I,ADR,ETU,LI,REPL,VISU,MODEX
 S ETU=$$REP^%DLETUDE,REPL=$$LAN^%DLCON2,(MODEX,VISU)=0
 I $$^%QSCALVA(ETU,NOM,"TYPE.ETUDE")'="JALONNEMENT" Q
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 
 S ADR=$$ADDETU^%DLANCEX I $D(@ADR@(NOM)) K @ADR@(NOM)
 
 
 
 S LI=$$^%QSCALVA(ETU,NOM,"LISTE.LANCEMENTS")
 I LI="" G SUL
 S ADR=$$ADRLIS^%QSGEST7(LI)
 I (ADR="")!(ADR=0) G SUL
 S LI=""
 F %I=0:0 S LI=$O(@ADR@(LI)) Q:LI=""  D SU(LI)
 G SU2
SUL 
 S LI=$$^%QSCALVA(ETU,NOM,"LANCEMENT")
 I LI'="" D SU(LI)
SU2 
 D SX^%QSGESTK(ETU,NOM),POCLEPA^%VVIDEO
 Q
 
SU(L) 
 D PSV^%QSGESTI(REPL,L,"ETUDE"),RETRAIT^%DLLANC2(REPL,L,"","")
 Q
 
 
 
 
CREER2(NOM,COMM,L,LIST,MODE,SENS,LIM,CAPA,ATT,FLU,DEC,TYPDEC,POUR,NBITER,MODEX,MODAF) 
 G CREER3
 
CREER(NOM,COMM,L,LIST,MODE,SENS,LIM,CAPA,ATT,FLU,DEC,TYPDEC,POUR,NBITER) 
 N MODEX,MODAF
 S MODEX=0,MODAF=0
 
CREER3 N ETU
 D MSG^%VZEATT($$^%QZCHW("Sauvegarde de l'etude"))
 S ETU=$$REP^%DLETUDE
 D PA("NOM",NOM)
 D PA("COMMENTAIRE",COMM)
 D PA("TYPE.ETUDE","JALONNEMENT")
 D PA("LANCEMENT",L)
 D PA("LISTE.LANCEMENTS",LIST)
 D PA("MODE.EVALUATION",MODE)
 D PA("SENS.JALONNEMENT",SENS)
 D PA("DATE.LIMITE.DEBUT",LIM)
 D PA("RESPECT.CAPACITES.MACHINES",CAPA)
 D PA("ATELIER",FLU)
 D PA("ATTRIBUT.TOTALISATION",ATT)
 D PA("DECALAGE",DEC)
 I DEC="NON" S (TYPDEC,POUR,NBITER)=""
 D PA("TYPE.DECALAGE",TYPDEC)
 I TYPDEC="C" S NBITER=""
 I TYPDEC="R" S POUR=""
 D PA("CONTRACTION",POUR)
 D PA("NOMBRE.ITERATIONS",NBITER)
 D PA("DATE.CREATION",$$TEMPS^%QMDATE)
 
 I L'="" D AFF^%DLNOMG($$LAN^%DLCON2,L,"ETUDE",NOM,1) G FC
 N %I,ADR,I
 S ADR=$$ADRLIS^%QSGEST7(LIST) I (ADR="")!(ADR=0) G FC
 S I=""
 F %I=0:0 S I=$O(@ADR@(I)) Q:I=""  D AFF^%DLNOMG($$LAN^%DLCON2,I,"ETUDE",NOM,1)
FC D OFF^%VZEATT
 Q
 
PA(ATR,VAL) 
 I VAL="",MODEX'=1 D PSV^%QSGESTI(ETU,NOM,ATR) D:MODEX=2 STATT^%TLBAATT(ETU,NOM,ATR,"",1,"SUPPRESSION")
 D AFF^%DLNOMG(ETU,NOM,ATR,VAL,1)
 Q
 
 
LOAD(NOM,RESUL) 
 N ETU,ADR,I
 S ETU=$$REP^%DLETUDE
 S RESUL(1)=$$AT("NOM")
 S RESUL(2)=$$AT("COMMENTAIRE")
 S RESUL(3)=$$AT("LANCEMENT")
 S RESUL(4)=$$AT("LISTE.LANCEMENTS")
 F I=5:1:10 S RESUL(I)=""
 I RESUL(3)'="" G REC
 I $$CARD^%QSGEST7(RESUL(4))'=1 G L2
 S ADR=$$ADRLIS^%QSGEST7(RESUL(4))
 S RESUL(3)=$O(@ADR@(""))
REC 
 
 D RECUP(RESUL(3),"RESUL")
L2 S RESUL(11)=$$AT("MODE.EVALUATION")
 S RESUL(12)=$$AT("SENS.JALONNEMENT")
 S I="DATE.LIMITE.DEBUT"
 S RESUL(13)=$$AFFI^%QMDAUC(ETU,I,$$AT(I))
 S RESUL(14)=$$AT("RESPECT.CAPACITES.MACHINES")
 S RESUL(15)=$$AT("ATTRIBUT.TOTALISATION")
 S RESUL(16)=$$AT("ATELIER")
 S RESUL(17)=$$AT("DECALAGE")
 I RESUL(17)="NON" S (RESUL(18),RESUL(19),RESUL(20))="" Q
 S RESUL(18)=$$AT("TYPE.DECALAGE")
 S RESUL(19)=$$AT("CONTRACTION")
 S RESUL(20)=$$AT("NOMBRE.ITERATIONS")
 Q
 
AT(ATR) 
 Q $$^%QSCALVA(ETU,NOM,ATR)
 
 
RECUP(LAN,GL) 
 
 N ATR,I,LIEN,REP
 S REP=$$LAN^%DLCON2
 
 S LIEN=$$LIEN1^%QSGEL2(REP,$$ART^%DLCON2,3)
 
 S @GL@(5)=$$^%QSCALVA(REP,LAN,LIEN)
 S @GL@(7)=$$^%QSCALVA(REP,LAN,"GAMME")
 S ATR=$$DELAI^%DLCON2
 
 S @GL@(8)=$$AFFI^%QMDAUC(REP,ATR,$$^%QSCALVA(REP,LAN,ATR))
 S @GL@(6)=$$^%QSCALVA(REP,LAN,"QUANTITE")
 S @GL@(9)=$$^%QSCALVA(REP,LAN,"STATUT")
 S @GL@(10)=$$^%QSCALVA(REP,LAN,"STADE")
 Q
 
 
 
RETCHARG(MODEX,VISU,REPETU,ETUDE,MESS) 
 N %I,ADR,LI,REPL
 S MESS="",REPL=$$LAN^%DLCON2
 I $$^%QSCALVA(REPETU,ETUDE,"TYPE.ETUDE")'="JALONNEMENT" S MESS=$$^%QZCHW("L'etude ne concerne pas un jalonnement") D:VISU ^%VZEAVT(MESS) Q
 S LI=$$^%QSCALVA(REPETU,ETUDE,"LISTE.LANCEMENTS")
 I LI="" G SURC
 S ADR=$$ADRLIS^%QSGEST7(LI)
 I (ADR="")!(ADR=0) G SURC
 S LI=""
 F %I=0:0 S LI=$O(@ADR@(LI)) Q:LI=""  D:MODEX'=1 RETRAIT^%DLLANC2(REPL,LI,"","")
 G SURC2
SURC 
 S LI=$$^%QSCALVA(REPETU,ETUDE,"LANCEMENT")
 I LI'="" D:MODEX'=1 RETRAIT^%DLLANC2(REPL,LI,"","")
SURC2 Q

