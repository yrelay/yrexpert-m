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

;%DLGITE2^INT^1^59547,73868^0
DLGITE2 ;
 
 
 
 
 
 
 
 
 
 
CONTAMO 
 
 
 S SOM="",DL=DATELIM
COBAM1 S SOM=$O(@RACINES@(SOM))
 G:SOM="" COBAM2
 S MA=@OP@(SOM,0),CHA=@OP@(SOM,2)
 S CAPST=$$CAPASTA^%DLCAP2(MA,"",0)
 S DEC2=0,PREM=0,DA=DATE
 G:'($D(@DATEFIX@(@OP@(SOM,1)))) COBAM1L
 S DA=@DATEFIX@(@OP@(SOM,1))
 I DA<DATE S ERR=43 G DEC
 I '($$DECAL^%DLCAP2(DATE,DA,@REGIMAC@(MA),.DEC1,MAXITER)) S ERR=43 G CONTER
 S PREM=1
COBAM1L S RES2=$$DATAMON^%DLCAPA(MA,"",CAPST,DA,DATELIM,CHA,@REGIMAC@(MA),PLUS,PREM,NBITER,MAXITER,.DB2,.DF2,.DEC2)
 I RES2=0 S ERR=$S(PREM=1:43,1:40) G CONTER^%DLGITER
 K @NONTRAIT@(SOM)
 S:DB2<DATELIM ERRNBL=8
 S LOP=$S(DEC2=0:"",1:"("_LDEC_" "_DEC2_" "_LJOURS_")")
 G:'($$COAM^%DLGITER) CONTER^%DLGITER
 G COBAM1
 
 
COBAM2 S SOM=$ZP(@NONTRAIT@(SOM))
 G:SOM="" CONTCONT^%DLGITER
 
 S SUIV="",ERRSTAN=42
COBAM3 S SUIV=$O(@GRAPH@(SOM,SUIV))
 G:SUIV="" COBAM4
 G:$D(@NONTRAIT@(SUIV)) COBAM2
 G COBAM3
 
COBAM4 
 S D=999999,LOP="",DL=DATE
 S MA=@OP@(SOM,0)
 S SUIV=""
COBAM5 S SUIV=$O(@GRAPH@(SOM,SUIV))
 G:SUIV="" COBAM6
 S D2=$$RETJOUR^%QMDRUTI(@OP@(SUIV,3),@GRAPH@(SOM,SUIV),@REGIMAC@(MA),.ERR)
 I ERR'=0 S ERR=ERR+36 G CONTER^%DLGITER
 S:D2<DATELIM ERRNBL=8
 S:@OP@(SUIV,3)<DL DL=@OP@(SUIV,3)
 S:(D2<D)!(LOP="") D=D2,LOP=SUIV
 G COBAM5
 
COBAM6 S CHA=@OP@(SOM,2)
 S CAPST=$$CAPASTA^%DLCAP2(MA,"",0)
 S LOP=$$^%QZCHW("Jalon entre")_" "_@OP@(SOM)_" "_$$^%QZCHW("et")_" "_@OP@(LOP)_" : "_@GRAPHINV@(LOP,SOM)
 K @NONTRAIT@(SOM)
 S DEC1=0,DEC2=0,PREM=0,DA=D
 G:'($D(@DATEFIX@(@OP@(SOM,1)))) COBAM6L
 S DA=@DATEFIX@(@OP@(SOM,1))
 I '($$DECAL^%DLCAP2(D,DA,@REGIMAC@(MA),.DEC1,MAXITER)) S ERR=43 G CONTER
 S PREM=1,DEC2=DEC1
COBAM6L S RES1=$$DATAVAL^%DLCAPA(MA,"",CAPST,DA,DL,CHA,@REGIMAC@(MA),PLUS,PREM,NBITER,MAXITER,.DB1,.DF1,.DEC1)
 S RES2=$$DATAMON^%DLCAPA(MA,"",CAPST,DA,DATELIM,CHA,@REGIMAC@(MA),PLUS,PREM,NBITER,MAXITER,.DB2,.DF2,.DEC2)
 I (RES1=0)&(RES2=0) S ERR=$S(PREM:43,1:40) G CONTER^%DLGITER
 S ERRNONBL=0
 G:RES1=0 COBAMAM
 G:RES2=0 COBAMAV
 G:DEC1<DEC2 COBAMAV
 
COBAMAM S LOP=LOP_$S(DEC2=0:"",1:" ("_LDEC_" "_DEC2_" "_LJOURS_")")
 S DL=DATELIM
 S:DB2<DATELIM ERRNBL=8
 G:'($$COAM^%DLGITER) CONTER^%DLGITER
 S SOM=""
 G COBAM2
 
COBAMAV S LOP=LOP_$S(DEC1=0:"",1:" ("_LDEC_" "_DEC1_" "_LJOURS_")")
 S:DF1>DATE ERRNBL=8
 G:'($$COAV^%DLGITER) CONTER^%DLGITER
 S SOM=""
 G COBAM2
 
 
 
 
 
 
 
 
 
 
 
 
 
MAXITER(REPLA,LAN,STAD,MAXITER) 
 N STA
 S STA=""
BMAXIT S STA=$O(^[QUI]QUERY3(REPLA,LAN,STA))
 Q:STA'<STAD
 G:'($D(^[QUI]QUERY3(REPLA,LAN,STA,"NB.JOURS.DECALAGE"))) BMAXIT
 S MAXITER=MAXITER-$$ABS^%TLCAMTH($O(^[QUI]QUERY3(REPLA,LAN,STA,"NB.JOURS.DECALAGE","")))
 G BMAXIT

