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

;%DLCDAT^INT^1^59547,73867^0
JLCDAT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CALCU(SENS,DATE,DATELIM,CHEM,PLPREC,GRAPH,GRAPHINV,FEUILLES,RACINES,OP,REGIMAC,OPDAT,GLERR) 
 N SOM,DAT,MERR,PR,NONTRAIT,ERRGLO,D,DAT,LOP,PREC,SUIV,ERRT
 S ERR=0,ERRGLO=0,SOM="",ERRT=0
 S NONTRAIT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NON.TRAITES")
 K @(NONTRAIT)
 F D=0:0 S SOM=$O(@OP@(SOM)) Q:SOM=""  S @NONTRAIT@(SOM)=""
 G:SENS=-1 AMONT
 
 
 
 S SOM=""
BAVA1 S SOM=$O(@FEUILLES@(SOM))
 G:SOM="" BAVA2
 S D=$$ADDJOUR^%QMDRUTI(DATE,0,@REGIMAC@(@OP@(SOM,0)),.ERRT)
 K @NONTRAIT@(SOM)
 I ERRT S ERR=ERRT+36 G BAVA1
 I D>DATELIM S ERRNONBL=8
 S @OPDAT@(SOM)=D
 S @OPDAT@(SOM,"L")=""
 G BAVA1
 
BAVA2 S SOM=$O(@NONTRAIT@(SOM))
 G:SOM="" FCALCU
 S PREC="",DAT=0,LOP=""
 
BAVA3 S PREC=$O(@GRAPHINV@(SOM,PREC))
 G:PREC="" BAVA4
 G:$D(@NONTRAIT@(PREC)) BAVA2
 G BAVA3
 
BAVA4 S PREC=$O(@GRAPHINV@(SOM,PREC))
 G:PREC="" BAVA40
 G:'($D(@OPDAT@(PREC))) BAVA4
 S D=$$ADDJOUR^%QMDRUTI(@OPDAT@(PREC),@GRAPH@(PREC,SOM),@REGIMAC@(@OP@(PREC,0)),.ERRT)
 I ERRT S ERR=ERRT+36 G BAVA4
 I (D>DAT)!(LOP="") S DAT=D,LOP=PREC
 G BAVA4
 
BAVA40 K @NONTRAIT@(SOM)
 I LOP="" S SOM="" G BAVA2
 I DAT>DATELIM S ERRNONBL=8
 S @OPDAT@(SOM)=DAT
 S @OPDAT@(SOM,"L")=$$^%QZCHW("Jalon entre")_" "_@DESOP@(LOP)_" "_$$^%QZCHW("et")_" "_@DESOP@(SOM)_" : "_@GRAPH@(LOP,SOM)
 S SOM=""
 G BAVA2
 
 
AMONT 
 S SOM=""
BAMO1 S SOM=$O(@RACINES@(SOM))
 G:SOM="" BAMO2
 S D=$$RETJOUR^%QMDRUTI(DATE,0,@REGIMAC@(@OP@(SOM,0)),.ERRT)
 K @NONTRAIT@(SOM)
 I ERRT S ERR=ERRT+36 G BAMO1
 I D<DATELIM S ERRNONBL=8
 S @OPDAT@(SOM)=D
 S @OPDAT@(SOM,"L")=""
 G BAMO1
 
BAMO2 S SOM=$ZP(@NONTRAIT@(SOM))
 G:SOM="" FCALCU
 S SUIV="",DAT=9999999999E-0,LOP=""
 
BAMO3 S SUIV=$O(@GRAPH@(SOM,SUIV))
 G:SUIV="" BAMO4
 G:$D(@NONTRAIT@(SUIV)) BAMO2
 G BAMO3
 
BAMO4 S SUIV=$O(@GRAPH@(SOM,SUIV))
 G:SUIV="" BAMO40
 G:'($D(@OPDAT@(SUIV))) BAMO4
 S D=$$RETJOUR^%QMDRUTI(@OPDAT@(SUIV),@GRAPHINV@(SUIV,SOM),@REGIMAC@(@OP@(SOM,0)),.ERRT)
 I ERRT S ERR=ERRT+36 G BAMO4
 I (D<DAT)!(LOP="") S DAT=D,LOP=SUIV
 G BAMO4
 
BAMO40 K @NONTRAIT@(SOM)
 I LOP="" S SOM="" G BAMO2
 I DAT<DATELIM S ERRNONBL=8
 S @OPDAT@(SOM)=DAT
 S @OPDAT@(SOM,"L")=$$^%QZCHW("Jalon entre")_" "_@DESOP@(SOM)_" "_$$^%QZCHW("et")_" "_@DESOP@(LOP)_" : "_@GRAPHINV@(LOP,SOM)
 S SOM=""
 G BAMO2
 
 
FCALCU I $D(@NONTRAIT) D ADDERPLA(NONTRAIT)
 K @(NONTRAIT)
 Q ERR=0
 
ADDER(SOMMET,MESSAGE) 
 I '($D(@GLERR)) S @GLERR=0
 S @GLERR@(@GLERR+1)=SOMMET_" : "_MESSAGE
 S @GLERR=@GLERR+1
 S ERRGLO=1,ERR=0
 Q
 
ADDERPLA(NONTRAIT) 
 N NO,LIB,O,%O
 S NO=$S($D(@GLERR):@GLERR+1,1:1)
 S @GLERR@(NO)=$$^%QZCHW("Les operations suivantes n'ont pu etre placees : ")
 S NO=NO+1
 S O="",LIB="     "
 F %O=0:0 S O=$O(@NONTRAIT@(O)) Q:O=""  S LIB=LIB_@OP@(O,1)_", "
 S @GLERR@(NO)=$E(LIB,1,$L(LIB)-2)
 S @GLERR=NO+1
 S ERRGLO=1
 Q

