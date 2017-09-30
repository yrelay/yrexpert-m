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

;%QMCPAE^INT^1^59547,73876^0
%QMCPAE ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CONS(ETU,TRT,IND,SAV,XMODE,SUP,IO,ERR,OK) 
 N RETU,GAM,NSAV,ULISTE,TEMP,LTRT,REPG
 N TAL,TAG,INSEPK,INCOMPK,LLISTEN,L,GAM,ADRL,BASEL,LETU,LLISTE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CONS")
 S ULISTE=$$CONCAS^%QZCHAD(TEMP,"ULISTE")
 S LTRT=$$CONCAS^%QZCHAD(TEMP,"LTRT")
 K @(TEMP)
 S NSAV="SAV1"
 S RETU=$$REP^%QNEQETU
 S TAL=$$^%QSCALVA(RETU,ETU,"TRAITEMENT.ACCEPTATION.LOCAL")
 S TAG=$$^%QSCALVA(RETU,ETU,"TRAITEMENT.ACCEPTATION.GLOBAL")
 S INSEPK=$$^%QSCALVA(RETU,ETU,"LISTE.GROUPES.INSEPARABLES")
 S INCOMPK=$$^%QSCALVA(RETU,ETU,"LISTE.GROUPES.INCOMPATIBLES")
 S LLISTEN=$$^%QSCALVA(RETU,ETU,"LISTE.POSTES")
 S L=$$^%QSCALVA(RETU,ETU,"LISTE.OPERATIONS.GAMME")
 S GAM=$$^%QSCALVA(RETU,ETU,"NOM.GAMME")
 S REPG=$$^%QSCALVA(RETU,ETU,"REPERTOIRE.GAMME")
 D POCLEPA^%VVIDEO
 D RECUP^%QNEQETU(ETU,.REPG,.GAM,.L,.MSG)
 I MSG'="" D ADD^%VPRIN1(ERR,MSG) K @(TEMP) Q
 S ADRL=$$ADRLT^%QSGEST7(L)
 I (ADRL=0)!(ADRL="") D TRI^%QSGES11(L,.ADRL)
 
 S BASEL=$$BASE^%QSGEST7(L)
 I BASEL="" D ADD^%VPRIN1(ERR,$$^%QZCHW("impossible de retrouver les individus de la liste d'operations")_" "_L) K @(TEMP) Q
 
 
 D LTMP(.LETU,"INDIVIDU",RETU)
 D STOCK^%QSGES11(LETU,ETU)
 D INDH^%QMCPAF(SAV,NSAV,LETU,WHOIS,QUI,WHOIS2,QUI2)
 
 
 
 D LTMP(.LLISTE,"INDIVIDU","L0")
 
 S:INSEPK'="" @ULISTE@(INSEPK)=""
 
 S:INCOMPK'="" @ULISTE@(INCOMPK)=""
 
 S:LLISTEN'="" @ULISTE@(LLISTEN)=""
 D:$D(@ULISTE) UNION^%QS0CALC(ULISTE,LLISTE)
 D STOCK^%QSGES11(LLISTE,INSEPK)
 D STOCK^%QSGES11(LLISTE,INCOMPK)
 D STOCK^%QSGES11(LLISTE,LLISTEN)
 
 D STOCK^%QSGES11(LLISTE,L)
 D INDH^%QMCPAF(SAV,NSAV,LLISTE,WHOIS,QUI,WHOIS2,QUI2)
 
 
 I IND D INDH^%QMCPAF(SAV,NSAV,L,WHOIS,QUI,WHOIS2,QUI2)
 
 
 I TAG'="" S @LTRT@(TAG)=""
 I TAL'="" S @LTRT@(TAL)=""
 I TRT D TRT^%QMCPAF(SAV,NSAV,LTRT,WHOIS,QUI,WHOIS2,QUI2)
 
 D SAVE^%QMCPAD(SAV,XMODE,SUP,IO,ERR,.OK)
 
 D DEL^%QSGES11(LETU)
 D DEL^%QSGES11(LLISTE)
 Q
 
LTMP(LL,TYPE,BASE) 
 N TL
 S TL="TMP"
 S LL=$$NOM^%QSGES11(TL)
 D CRETYP^%QSGES11(BASE,LL,TL,0,"SAV",$$STO^%QSGES11(LL),"SAV",TYPE,$$STOTRI^%QSGES11)
 Q
 
 
 
DIA N CTR,ETUDE,DX,DY,MODE,MODAF,ABANDON,OK,XMODE,WHOIS2,QUI2
 N TEMP,SAV,SUP,IO,TRT,IND,STOP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DIA") K @(TEMP)
 S SAV=$$CONCAS^%QZCHAD(TEMP,"SAV")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 S MODE=$$^%QZCHW("sauvegarde")
 S XMODE=3
 S WHOIS2=WHOIS,QUI2=QUI
AC D REAFF^%QNEQACT(MODE)
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QNEQACT("""_MODE_""")","$$UC^%QNEQACT",.CTR,.ETUDE)
 I (CTR=0)!(ETUDE="") Q
 D REAFF^%QNEQACT(MODE)
 I XMODE=1 S SUP="",IO=0 G AC1
 D SUP^%QMCPOZ1(.SUP,.IO,.STOP,"REAFF^%QNEQACT("_MODE_")")
 I STOP Q
AC1 S TRT=$$POS^%VZEOUI($$^%QZCHW("Sauvegarde des traitements associes ?"),"O",0,22)
 S IND=$$POS^%VZEOUI($$^%QZCHW("Sauvegarde des individus associes ?"),"O",0,22)
 S OK=1
 D CONS(ETUDE,TRT,IND,SAV,XMODE,SUP,IO,ERR,.OK)
 I '(OK) D AFFERR^%QMCPZ(ERR,MODE)
 K @(TEMP)
 Q
 
 
 
DIA2 N CTR,ETUDE,DX,DY,MODE,MODAF,ABANDON,OK,XMODE,WHOIS2,QUI2
 N TEMP,SAV,SUP,IO,TRT,IND
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DIA")
 S SAV=$$CONCAS^%QZCHAD(TEMP,"SAV")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 K @(TEMP)
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("COPIE D'ETUDES D'EQUILIBRAGE"))
 S WHOIS2=$$WHOIS2^%QMCPSF(WHOIS,.QUI,.QUI2)
 Q:WHOIS2=""
 S MODE=$$^%QZCHW("Copie d'etudes d'equilibrage")
 S XMODE=1
 G AC

